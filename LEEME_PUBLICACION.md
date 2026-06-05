# Función para actualizar GitHub Pages con un comando

## Archivos incluidos

- `publicar.R`
- `ejecutar_publicacion.R`
- `publicar_github_pages.bat`

## Opción recomendada desde RStudio

Copia `publicar.R` en la raíz de tu proyecto Quarto.

Luego, cuando realices cambios en tus archivos `.qmd`, imágenes o estilos, ejecuta en la consola de R:

```r
source("publicar.R")
publicar("Actualizar modulo")
```

También puedes cambiar el mensaje:

```r
publicar("Actualizar bloque 2 y estilos")
```

La función ejecuta automáticamente:

```bash
quarto render
git add .
git commit -m "mensaje"
git push
```

## Opción de un solo comando exacto

Si quieres hacerlo en una sola línea desde la consola de R:

```r
source("publicar.R"); publicar("Actualizar modulo")
```

## Opción con doble clic en Windows

Copia estos tres archivos en la raíz del proyecto:

- `publicar.R`
- `ejecutar_publicacion.R`
- `publicar_github_pages.bat`

Luego haz doble clic en:

```text
publicar_github_pages.bat
```

## Requisitos

- Git instalado y funcionando.
- Quarto instalado.
- Proyecto ya conectado a GitHub.
- `_quarto.yml` con `output-dir: docs`.
