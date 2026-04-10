#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

latexmk -lualatex -outdir=build -interaction=nonstopmode -halt-on-error main.tex
