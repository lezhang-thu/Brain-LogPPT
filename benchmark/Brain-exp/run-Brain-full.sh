#!/bin/bash

set -ex
for k in {0..0}; do
	echo $k

	cd ../evaluation/
	python Brain_eval.py -full --output-dir ../Brain-exp/result-Brain-full-$k

	cd ../Brain-exp
done
