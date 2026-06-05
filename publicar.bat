@echo off
echo Renderizando libro Quarto...
quarto render

echo Agregando cambios a Git...
git add .

echo Creando commit...
git commit -m "Actualizar módulo de instalaciones civiles e industriales"

echo Subiendo a GitHub...
git push

echo Proceso finalizado.
pause
