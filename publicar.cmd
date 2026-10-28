@echo off
REM ==== Publica la pagina "Sonidos de Tarapoto" en GitHub Pages ====
REM Requiere: gh ya autenticado (lo estas). Doble clic o ejecutar en terminal.
cd /d "%~dp0"

echo Creando el repositorio publico y subiendo...
gh repo create sonidos-tarapoto --public --source=. --remote=origin --push
if errorlevel 1 goto :error

echo.
echo Activando GitHub Pages (rama main, raiz)...
gh api --method POST "repos/joseluismontezamilian12-rgb/sonidos-tarapoto/pages" -f "source[branch]=main" -f "source[path]=/"

echo.
echo ============================================================
echo  Listo. En ~1 minuto estara disponible en:
echo  https://joseluismontezamilian12-rgb.github.io/sonidos-tarapoto/
echo ============================================================
echo  Si Pages no quedo activo, entra a:
echo  Settings ^> Pages ^> Branch: main / (root) ^> Save
echo.
echo  AVISA A CLAUDE cuando termine para generar el QR.
pause
exit /b 0

:error
echo.
echo Hubo un problema creando el repo (quiza ya existe). Revisa el mensaje de arriba.
pause
exit /b 1
