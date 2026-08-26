$port = 8080
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")

try {
    $listener.Start()
    Write-Host "Local server listening on http://localhost:$port/ (with HTTP 206 Partial Content Range support)"
    while ($listener.IsListening) {
        try {
            $context = $listener.GetContext()
            $request = $context.Request
            $response = $context.Response
            $localPath = $request.Url.LocalPath
            if ($localPath -eq '/') { $localPath = '/index.html' }
            $filePath = Join-Path $PSScriptRoot $localPath.TrimStart('/').Replace('/', '\')
            
            if (Test-Path $filePath -PathType Leaf) {
                $file = [System.IO.File]::Open($filePath, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::ReadWrite)
                $totalLength = $file.Length
                $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
                $mime = switch ($ext) {
                    '.html' { 'text/html; charset=utf-8' }
                    '.css'  { 'text/css; charset=utf-8' }
                    '.js'   { 'application/javascript; charset=utf-8' }
                    '.png'  { 'image/png' }
                    '.jpg'  { 'image/jpeg' }
                    '.jpeg' { 'image/jpeg' }
                    '.svg'  { 'image/svg+xml' }
                    '.mp4'  { 'video/mp4' }
                    '.webp' { 'image/webp' }
                    default { 'application/octet-stream' }
                }

                $response.ContentType = $mime
                $response.AddHeader("Accept-Ranges", "bytes")
                $response.AddHeader("Access-Control-Allow-Origin", "*")

                $rangeHeader = $request.Headers["Range"]
                $start = 0
                $end = $totalLength - 1
                $isRange = $false

                if ($rangeHeader -and $rangeHeader.StartsWith("bytes=")) {
                    $rangeValue = $rangeHeader.Substring(6).Trim()
                    $dashIdx = $rangeValue.IndexOf('-')
                    if ($dashIdx -ge 0) {
                        $startStr = $rangeValue.Substring(0, $dashIdx).Trim()
                        $endStr = $rangeValue.Substring($dashIdx + 1).Trim()
                        if ($startStr -ne '') { [int64]::TryParse($startStr, [ref]$start) | Out-Null }
                        if ($endStr -ne '') { [int64]::TryParse($endStr, [ref]$end) | Out-Null }
                        $isRange = $true
                    }
                }

                if ($isRange) {
                    if ($end -ge $totalLength) { $end = $totalLength - 1 }
                    $contentLength = $end - $start + 1
                    $response.StatusCode = 206
                    $response.AddHeader("Content-Range", "bytes $start-$end/$totalLength")
                    $response.ContentLength64 = $contentLength
                    $file.Seek($start, [System.IO.SeekOrigin]::Begin) | Out-Null
                    
                    $buffer = New-Object byte[] 65536
                    $remaining = $contentLength
                    while ($remaining -gt 0) {
                        $toRead = [int][Math]::Min(65536, $remaining)
                        $bytesRead = $file.Read($buffer, 0, $toRead)
                        if ($bytesRead -le 0) { break }
                        $response.OutputStream.Write($buffer, 0, $bytesRead)
                        $remaining -= $bytesRead
                    }
                } else {
                    $response.StatusCode = 200
                    $response.ContentLength64 = $totalLength
                    $buffer = New-Object byte[] 65536
                    while ($true) {
                        $bytesRead = $file.Read($buffer, 0, 65536)
                        if ($bytesRead -le 0) { break }
                        $response.OutputStream.Write($buffer, 0, $bytesRead)
                    }
                }
                $file.Close()
            } else {
                $response.StatusCode = 404
                $msg = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
                $response.OutputStream.Write($msg, 0, $msg.Length)
            }
            $response.OutputStream.Close()
        } catch {
            try {
                if ($response -and $response.OutputStream) {
                    $response.OutputStream.Close()
                }
            } catch {}
        }
    }
} finally {
    $listener.Stop()
}
