#!/bin/bash
set -ex
for k in {0..0}; do
	echo $k
	rm -rf datasets
	python fewshot_sampling.py
	python convert_fewshot_label.py datasets
	./train_full.sh

	mv result_LogPPT_full result-LogPPT-full-$k

	cd ../evaluation/
	python LogPPT_eval.py -full --output-dir ../LogPPT/result-LogPPT-full-$k

	cd ../LogPPT
done
