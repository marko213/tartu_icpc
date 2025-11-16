# University of Tartu ICPC Team Notebook

## Setup

Initialize submodules:
```bash
git submodule update --init
```

(Set up a venv: `python3 -m venv venv ; venv/bin/activate`.)

Install `pygments` and tartu_icpc pygments style:
```bash
pip install pygments ./pygments
```

Obtain [prince](https://www.princexml.com/download/), then correct the path to prince in the Makefile or add it as an argument.

Make sure `qpdf` and `pdflatex` are set up.

## Build

```bash
make
```

or something like

```bash
make PRINCE="steam-run prince/lib/prince/bin/prince"
```

## Changes

Add new files to `file_ord.txt`.

To change general latex options edit `header.tex`.

## Weirdness

- `prince` might (??) refer to `www.levien.com`, but the correct name is `levien.com`, causing certificate problems; this can be resolved by adding `--insecure`.
