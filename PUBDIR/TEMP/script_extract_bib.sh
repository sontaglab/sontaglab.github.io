#!/bin/tcsh -f

set bib = "retroactivity_publications_eds.bib"
set dest = "TEMP-retroactivity"

if (! -e "$bib") then
    echo "Cannot find $bib"
    exit 1
endif

mkdir -p "$dest"

set n = 0
set missing = 0

foreach pdf (`sed -n 's/^[[:space:]]*pdf[[:space:]]*=[[:space:]]*{\([^}]*\)}.*/\1/p' "$bib"`)
    if (-e "$pdf") then
        echo "Copying $pdf"
        cp -p "$pdf" "$dest"/
        @ n++
    else
        echo "MISSING: $pdf"
        @ missing++
    endif
end

echo ""
echo "Copied $n PDF files to $dest"
if ($missing > 0) then
    echo "$missing PDF file(s) were not found."
endif
