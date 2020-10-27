#!/usr/bin/env python
# This script takes in a text file of sample names, and outputs a dag for each sample and a top-level dag. For use with the RGAPepPipe.

import sys
import os
import argparse
from string import Template

    
def get_args():    
    parser = argparse.ArgumentParser(description='Pipeline for reference \
guided assembly')
    parser.add_argument("input", help="File describing read data information")
    parser.add_argument("reference", help="Fasta file of reference genome")
    parser.add_argument("dagtemplate", help="dag template")

    return parser.parse_args()

args = get_args()

with open(args.dagtemplate, "r") as template_file:
    template = Template(template_file.read())

with open(args.input, 'r') as infile:
    outfileName = args.input.split(".")[0] + "_toplevel.dag"
    with open(outfileName, "w") as outfile:
        for line in infile:
            line = line.strip()
            inputList = line.split()
            variableMap = {}
            variableMap['ref'] = args.reference
            variableMap['run'] = inputList[0]
            variableMap['sample'] = inputList[0]
            variableMap['lib'] = inputList[0]
            variableMap['platform'] = "illumina"
            with open("{0}_rga.dag".format(variableMap['run']), "w") as dagfile:
                out = template.substitute(variableMap)
                dagfile.write(out)
            outfile.write("SPLICE {0} {0}_rga.dag\n".format(variableMap['run']))
