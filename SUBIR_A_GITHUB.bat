@echo off
title Subir Garden by Valentina a GitHub
cd /d "%~dp0"
cls
echo ======================================================================
echo           CONECTAR Y SUBIR GARDEN BY VALENTINA A GITHUB
echo ======================================================================
echo.
echo Pasos que se van a realizar:
echo  1. Iniciar sesion en tu GitHub desde el navegador (solo 1 clic).
echo  2. Subir todos los archivos a https://github.com/akalxxbo/GardenbyValentina
echo.
echo Presiona cualquier tecla para abrir el inicio de sesion de GitHub...
pause >nul

echo.
echo [1/3] Iniciando conexion con GitHub...
"C:\Users\User\gh-cli\gh.exe" auth login --web -h github.com

echo.
echo [2/3] Configurando permisos de Git...
"C:\Users\User\gh-cli\gh.exe" auth setup-git

echo.
echo [3/3] Subiendo todos los archivos a tu repositorio en GitHub...
"C:\Users\User\mingit\cmd\git.exe" push -u origin main

echo.
echo ======================================================================
echo   COMPLETADO! AHORA RECARGA TU PAGINA DE GITHUB EN EL NAVEGADOR.
echo ======================================================================
echo.
pause
