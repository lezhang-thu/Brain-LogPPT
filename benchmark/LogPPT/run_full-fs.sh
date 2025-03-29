#!/bin/bash
set -ex
for k in {0..0}; do
	echo $k
	rm -rf datasets-fs-full-wo-vl
	python fs-full-wo-vl.py ../Brain-exp/result-Brain-full-0
	./fs-train_full.sh

	mv result_LogPPT-fs_full result-LogPPT-fs_full-$k

	cd ../evaluation/
	python LogPPT_eval.py -full --output-dir ../LogPPT/result-LogPPT-fs_full-$k

	cd ../LogPPT
done
