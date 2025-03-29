#!/bin/bash
set -ex
for k in {0..0}; do
	echo $k
	rm -rf datasets
	python fewshot_sampling.py
	./train_2k.sh

	mv result_LogPPT_2k result-LogPPT-2k-$k

	cd ../evaluation/
	python LogPPT_eval.py -otc --output-dir ../LogPPT/result-LogPPT-2k-$k

	cd ../LogPPT
done
