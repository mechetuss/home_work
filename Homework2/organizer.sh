#!/bin/bash

mkdir -p fastqs

for i in {1..10}
do
    filename="fastqs/sample_${i}.fastq"
    echo "This is sample number $i" > "$filename"
done
