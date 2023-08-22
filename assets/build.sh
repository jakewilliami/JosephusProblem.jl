#! /usr/bin/env bash

set -xe

LFLAGS="--file-line-error --synctex=1 --enable-write18"
PFLAGS="-verbose -density 500 -trim -quality 100 -sharpen 0x1.0"
pdflatex $LFLAGS formulae.tex
convert $PFLAGS formulae.pdf formulae.png

PDIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
julia --project="$PDIR" plot.jl
convert $PFLAGS plot.pdf plot.png
