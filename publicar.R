# ============================================================
# publicar.R
# Función para renderizar SOLO HTML y actualizar GitHub Pages
# Proyecto: Módulo Instalaciones Civiles e Industriales
# ============================================================

publicar <- function(mensaje = "Actualizar modulo") {

  cat("\n============================================\n")
  cat(" Publicación automática del módulo Quarto\n")
  cat(" Salida: HTML para GitHub Pages\n")
  cat("============================================\n\n")

  # 1. Verificar que se ejecuta desde la raíz del proyecto
  if (!file.exists("_quarto.yml")) {
    stop("No se encontró _quarto.yml. Abre el proyecto correcto o ubícate en la carpeta raíz.")
  }

  # 2. Verificar Quarto
  cat("1) Verificando Quarto...\n")
  quarto_version <- tryCatch(
    system("quarto --version", intern = TRUE),
    error = function(e) character(0)
  )

  if (length(quarto_version) == 0) {
    stop("Quarto no está disponible. Revisa la instalación de Quarto.")
  }

  cat("   Quarto detectado:", quarto_version[1], "\n\n")

  # 3. Verificar Git
  cat("2) Verificando Git...\n")
  git_version <- tryCatch(
    system("git --version", intern = TRUE),
    error = function(e) character(0)
  )

  if (length(git_version) == 0) {
    stop("Git no está disponible. Instala Git for Windows y reinicia RStudio.")
  }

  cat("   Git detectado:", git_version[1], "\n\n")

  # 4. Renderizar SOLO HTML
  # Esto evita errores de conversión SVG -> PDF cuando no está instalado rsvg-convert.
  cat("3) Renderizando el libro SOLO en HTML...\n")
  render_status <- system("quarto render --to html")

  if (render_status != 0) {
    stop("Falló quarto render --to html. Revisa el error mostrado arriba.")
  }

  if (!file.exists("docs/index.html")) {
    stop("No existe docs/index.html. Verifica que _quarto.yml tenga output-dir: docs.")
  }

  cat("   Renderizado HTML correcto: docs/index.html encontrado.\n\n")

  # 5. Mostrar estado
  cat("4) Revisando cambios detectados por Git...\n")
  system("git status --short")

  # 6. Agregar cambios
  cat("\n5) Agregando cambios...\n")
  add_status <- system("git add .")

  if (add_status != 0) {
    stop("Falló git add .")
  }

  # 7. Verificar si hay cambios para commit
  cat("\n6) Verificando si hay cambios para confirmar...\n")
  diff_status <- system("git diff --cached --quiet")

  if (diff_status == 0) {
    cat("   No hay cambios nuevos para confirmar.\n\n")
  } else {
    commit_cmd <- paste0('git commit -m "', mensaje, '"')
    commit_status <- system(commit_cmd)

    if (commit_status != 0) {
      stop("Falló git commit. Revisa user.name, user.email o conflictos pendientes.")
    }

    cat("   Commit creado correctamente.\n\n")
  }

  # 8. Subir cambios
  cat("7) Subiendo cambios a GitHub...\n")
  push_status <- system("git push")

  if (push_status != 0) {
    cat("\n   git push falló. Intentando con git push -u origin main...\n")
    push_status <- system("git push -u origin main")
  }

  if (push_status != 0) {
    stop("Falló git push. Revisa autenticación, conexión, rama o remoto.")
  }

  cat("\n============================================\n")
  cat(" Publicación completada correctamente\n")
  cat("============================================\n")
  cat("GitHub Pages se actualizará en unos minutos.\n\n")
}
