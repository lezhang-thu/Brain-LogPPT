#!/bin/bash
set -ex
for k in {0..0}; do
	echo $k
	rm -rf datasets-wo-virtual-label
	python x_fewshot_sampling.py
	python convert_fewshot_label.py datasets-wo-virtual-label
	./x_train_full.sh

	mv result_LogPPT_full-wo-virtual-label result-LogPPT-full-wo-virtual-label-$k

	cd ../evaluation/
	python LogPPT_eval.py -full --output-dir ../LogPPT/result-LogPPT-full-wo-virtual-label-$k

	cd ../LogPPT
done
