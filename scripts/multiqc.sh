#!/bin/bash
set -euo pipefail

# MultiQC container
CONTAINER=oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20

# the placeholder variables
indir="$1"
outdir="$2"

# Initial logging
echo "Starting script multiqc.sh"
date
echo "Input dir:  $indir"
echo "Output dir: $outdir"
echo

apptainer exec "$CONTAINER" \
    multiqc --outdir "$outdir" "$indir"

# Final logging
echo
echo "Successfully finished script multiqc.sh"
date