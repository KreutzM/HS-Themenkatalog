Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

latexmk -lualatex -outdir=build -interaction=nonstopmode -halt-on-error main.tex
