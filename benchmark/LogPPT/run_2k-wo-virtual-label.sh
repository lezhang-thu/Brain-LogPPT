#!/bin/bash
set -ex
for k in {0..0}; do
	echo $k
	rm -rf datasets-wo-virtual-label
	python x_fewshot_sampling.py
	./x_train_2k_wo_virtual_label.sh

	mv result_LogPPT_2k-wo-virtual-label result-LogPPT-2k-wo-virtual-label-$k

	cd ../evaluation/
	python LogPPT_eval.py -otc --output-dir ../LogPPT/result-LogPPT-2k-wo-virtual-label-$k

	cd ../LogPPT
done
