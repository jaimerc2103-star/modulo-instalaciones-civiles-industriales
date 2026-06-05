# publicar.R actualizado

Esta versión usa:

```bash
quarto render --to html
```

en lugar de:

```bash
quarto render
```

Esto evita el error de conversión `SVG -> PDF` cuando el objetivo es publicar en GitHub Pages.

## Uso

Copie `publicar.R` en la raíz del proyecto Quarto y ejecute en RStudio:

```r
source("publicar.R"); publicar("Actualizar modulo")
```
