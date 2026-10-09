#!/bin/bash
set -euo pipefail

CONTAINER=oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20

echo "Starting script multiqc.sh"
date
echo "Input dir:  results/fastqc"
echo "Output dir: results/multiqc"
echo

apptainer exec "$CONTAINER" \
    multiqc --outdir results/multiqc results/fastqc

echo
echo "Successfully finished script multiqc.sh"
date