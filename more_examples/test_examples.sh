#!/bin/bash

#TODO: FIXME: This should be replaced by a makefile

JASMINC="$(cd "$(dirname "${BASH_SOURCE[0]}")/../compiler" && pwd)/jasminc"

if [[ ! -f "$JASMINC" ]]; then
  echo "Error: jasminc not found at $JASMINC"
  exit 1
fi

BIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/bin/"

mkdir -p ${BIN_DIR}

for file in "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"/*.jazz; do
    if [[ -f "$file" ]]; then
        echo "Compiling $file..."
        ${JASMINC} -o ${BIN_DIR}/$(basename -- "$file").s "$file" || {
            echo "Error processing $file"
            exit 1
        }
    fi
done