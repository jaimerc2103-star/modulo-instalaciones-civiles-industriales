#!/usr/bin/env bash
set -e
quarto render
git add .
git commit -m "Actualizar módulo de instalaciones civiles e industriales" || echo "Sin cambios para confirmar"
git push
