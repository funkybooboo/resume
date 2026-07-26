# Awesome-CV Resume Makefile
# Requires: XeLaTeX (via TeX Live) or Overleaf.
# Note: tectonic CANNOT build awesome-cv --- its vendored XeTeX crashes on
# fontawesome5's virtual-font (utex) machinery with `free(): invalid pointer`.
# XeLaTeX from TeX Live is the supported build path (managed declaratively
# by ~/dotfiles migration 000231-texlive).

RESUME = resume
PDF = $(RESUME).pdf

# Default target --- XeLaTeX is the primary (and only working) build path.
all: xelatex

# Compile with XeLaTeX (primary build path; runs twice for cross-references)
xelatex: $(RESUME).tex
	xelatex $(RESUME).tex
	xelatex $(RESUME).tex

# Compile with Tectonic (DOES NOT WORK for awesome-cv; kept for reference)
tectonic: $(RESUME).tex
	@echo "ERROR: tectonic cannot build awesome-cv (crashes on fontawesome5)." >&2
	@echo "Use 'make xelatex' instead (requires TeX Live)." >&2
	exit 1

# Open the PDF
view: $(PDF)
	xdg-open $(PDF)

# Clean build artifacts
clean:
	rm -f *.aux *.log *.out *.toc *.fdb_latexmk *.fls *.synctex.gz *.bcf *.run.xml *.blg *.bbl

# Clean everything including PDF
distclean: clean
	rm -f $(PDF)

# Install Tectonic on Arch Linux
install-tectonic:
	@echo "Installing Tectonic via pacman..."
	sudo pacman -S tectonic

# Install TeX Live on Arch Linux (modern scheme metapackages; normally
# managed declaratively by ~/dotfiles migration 000231-texlive).
install-texlive:
	@echo "Installing TeX Live (this will take a while)..."
	sudo pacman -S texlive-xetex texlive-fontsextra texlive-latexextra

.PHONY: all tectonic xelatex view clean distclean install-tectonic install-texlive
