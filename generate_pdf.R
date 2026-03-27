# Script pour générer le PDF du Livret R
# Remplace tous les caractères Unicode problématiques pour pdflatex

input_file <- "memo_R.md"
temp_file <- "memo_R_pdf.md"
output_file <- "Livret_R.pdf"

# Lire le fichier
texte <- readLines(input_file, encoding = "UTF-8", warn = FALSE)
texte <- paste(texte, collapse = "\n")

# Remplacements exhaustifs Unicode → ASCII
replacements <- list(
  # Symboles mathématiques
  c("\u2260", "!="),        # ≠
  c("\u2265", ">="),        # ≥
  c("\u2264", "<="),        # ≤
  c("\u00d7", "x"),         # ×
  c("\u00f7", "/"),         # ÷
  c("\u00b1", "+/-"),       # ±
  c("\u221a", "racine"),    # √
  c("\u221e", "infini"),    # ∞

  # Lettres grecques
  c("\u03b1", "alpha"),     # α
  c("\u03b2", "beta"),      # β
  c("\u03bc", "mu"),        # μ
  c("\u03c3", "sigma"),     # σ
  c("\u03ba", "kappa"),     # κ
  c("\u03c0", "pi"),        # π
  c("\u03c7", "chi"),       # χ
  c("\u03b4", "delta"),     # δ
  c("\u03b5", "epsilon"),   # ε
  c("\u03bb", "lambda"),    # λ

  # Indices/exposants
  c("\u2080", "0"),         # ₀
  c("\u2081", "1"),         # ₁
  c("\u2082", "2"),         # ₂
  c("\u2083", "3"),         # ₃
  c("\u2070", "0"),         # ⁰
  c("\u00b2", "2"),         # ²
  c("\u00b3", "3"),         # ³

  # Flèches
  c("\u2192", "->"),        # →
  c("\u2190", "<-"),        # ←
  c("\u2194", "<->"),       # ↔
  c("\u2191", "^"),         # ↑
  c("\u2193", "v"),         # ↓

  # Tirets et guillemets
  c("\u2013", "--"),        # –
  c("\u2014", "---"),       # —
  c("\u2018", "'"),         # '
  c("\u2019", "'"),         # '
  c("\u201c", "\""),        # "
  c("\u201d", "\""),        # "
  c("\u2026", "..."),       # …

  # Emojis et symboles
  c("\u26A0", "ATTENTION"), # ⚠
  c("\uFE0F", ""),          # variation selector
  c("\u2705", "[OK]"),      # ✅
  c("\u274C", "[X]"),       # ❌
  c("\u2022", "-"),         # •

  # Combining characters
  c("\u0305", ""),          # combining overline
  c("\u0304", "")           # combining macron
)

for (r in replacements) {
  texte <- gsub(r[1], r[2], texte, fixed = TRUE)
}

# Écrire le fichier temporaire
writeLines(texte, temp_file, useBytes = TRUE)

cat("Fichier temporaire cree:", temp_file, "\n")
cat("Generation du PDF...\n")

pandoc_path <- "C:/Program Files/RStudio/resources/app/bin/quarto/bin/tools/pandoc.exe"
pdflatex_path <- "C:/Users/Alexis/AppData/Roaming/TinyTeX/bin/windows/pdflatex.exe"

cmd <- sprintf(
  '"%s" "%s" -o "%s" --pdf-engine="%s" -V geometry:margin=2cm -V fontsize=11pt --toc --toc-depth=3 -V toc-title="Sommaire"',
  pandoc_path, temp_file, output_file, pdflatex_path
)

result <- system(cmd, intern = TRUE)
cat(result, sep = "\n")

if (file.exists(output_file) && file.info(output_file)$size > 400000) {
  cat("\nPDF genere avec succes:", output_file, "\n")
  cat("Taille:", file.info(output_file)$size, "octets\n")
} else if (file.exists(output_file)) {
  cat("\nATTENTION: PDF existe mais taille inchangee (", file.info(output_file)$size, ") - probablement pas mis a jour\n")
} else {
  cat("\nErreur: PDF non genere\n")
}

# Nettoyer
if (file.exists(temp_file)) file.remove(temp_file)
