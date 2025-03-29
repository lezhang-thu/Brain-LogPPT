#!/bin/bash
set -ex
for k in {0..0}; do
	echo $k
	rm -rf datasets-brain-help-sample-from-full
	python brain-sample-from-full.py ../Brain-exp/result-Brain-full-0
	./brain-logppt-train_full.sh

	mv result_LogPPT-Brain-sample_full result-LogPPT-Brain-sample-full-$k

	cd ../evaluation/
	python LogPPT_eval.py -full --output-dir ../LogPPT/result-LogPPT-Brain-sample-full-$k

	cd ../LogPPT
done
