@echo off
echo ============================================
echo Actualizando modulo Quarto en GitHub Pages
echo ============================================

echo.
echo 1. Renderizando HTML...
quarto render --to html

IF %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERROR: Fallo quarto render --to html
    pause
    exit /b
)

echo.
echo 2. Agregando cambios a Git...
git add .

echo.
echo 3. Creando commit...
git commit -m "Actualizar modulo"

echo.
echo 4. Subiendo a GitHub...
git push

echo.
echo ============================================
echo Proceso terminado.
echo GitHub Pages se actualizara en unos minutos.
echo ============================================

pause