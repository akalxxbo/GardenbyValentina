$source = @"
using System;
using System.IO;
using System.Net;
using System.Threading;

public class FastServer {
    private HttpListener _listener;
    private string _root;
    private bool _running;

    public FastServer(int port, string root) {
        _root = root;
        _listener = new HttpListener();
        _listener.Prefixes.Add("http://localhost:" + port + "/");
    }

    public void Start() {
        _listener.Start();
        _running = true;
        _listener.BeginGetContext(OnRequest, null);
    }

    private void OnRequest(IAsyncResult ar) {
        if (!_running) return;
        try {
            var context = _listener.EndGetContext(ar);
            _listener.BeginGetContext(OnRequest, null);
            ThreadPool.QueueUserWorkItem(state => Process(context));
        } catch {
            if (_running) {
                try { _listener.BeginGetContext(OnRequest, null); } catch {}
            }
        }
    }

    private void Process(HttpListenerContext ctx) {
        try {
            var req = ctx.Request;
            var res = ctx.Response;
            string path = req.Url.LocalPath;
            if (path == "/") path = "/index.html";
            string fullPath = Path.Combine(_root, path.TrimStart('/').Replace('/', '\\'));

            if (File.Exists(fullPath)) {
                string ext = Path.GetExtension(fullPath).ToLower();
                string mime = "application/octet-stream";
                if (ext == ".html") mime = "text/html; charset=utf-8";
                else if (ext == ".css") mime = "text/css; charset=utf-8";
                else if (ext == ".js") mime = "application/javascript; charset=utf-8";
                else if (ext == ".png") mime = "image/png";
                else if (ext == ".jpg" || ext == ".jpeg") mime = "image/jpeg";
                else if (ext == ".webp") mime = "image/webp";
                else if (ext == ".svg") mime = "image/svg+xml";
                else if (ext == ".mp4") mime = "video/mp4";

                res.ContentType = mime;
                res.AddHeader("Access-Control-Allow-Origin", "*");
                res.AddHeader("Cache-Control", "no-cache");
                
                using (var fs = new FileStream(fullPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)) {
                    res.ContentLength64 = fs.Length;
                    res.StatusCode = 200;
                    byte[] buffer = new byte[65536];
                    int read;
                    while ((read = fs.Read(buffer, 0, buffer.Length)) > 0) {
                        res.OutputStream.Write(buffer, 0, read);
                    }
                }
            } else {
                res.StatusCode = 404;
                byte[] notFound = System.Text.Encoding.UTF8.GetBytes("404 Not Found");
                res.OutputStream.Write(notFound, 0, notFound.Length);
            }
            res.OutputStream.Close();
        } catch {
            try { ctx.Response.OutputStream.Close(); } catch {}
        }
    }

    public void Stop() {
        _running = false;
        try { _listener.Stop(); } catch {}
    }
}
"@

Add-Type -TypeDefinition $source -Language CSharp
$server = New-Object FastServer(8080, $PSScriptRoot)
$server.Start()
Write-Host "High-Performance Local Server running on http://localhost:8080/"

try {
    while ($true) {
        Start-Sleep -Seconds 3600
    }
} finally {
    $server.Stop()
}
