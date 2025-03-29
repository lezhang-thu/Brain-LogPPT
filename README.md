# A Unified Approach to Log Parsing: Combining Heuristic and Semantic Techniques

## Abstract

Existing log parsing techniques span categories such as heuristic-based (e.g., Brain), semantic-based (e.g., LogPPT), and others.

This repository discusses:
1. A combined parsing method that integrates the strengths of Brain and LogPPT.
1. Further improved few-shot learning capabilities of LogPPT by leveraging initial results from Brain to construct optimized few-shot examples.

This repository is based on [Loghub-2.0](https://github.com/logpai/loghub-2.0), [Brain](https://github.com/gaiusyu/Brain) and [LogPPT](https://github.com/LogIntelligence/LogPPT).

## Results (over Loghub-2.0 only)

| **Methods**      | **GA**    | **PA**   | **FGA**  | **FTA**  |
|:----------------:|:---------:|:--------:|:--------:|:--------:|
| **LogPPT**       |   0.573   | **0.744**|   0.562  |   0.474  |
| **Brain**        |   0.843   |   0.425  |   0.720  |   0.358  |
| **Brain-LogPPT** | **0.900** |   0.683  |**0.865** | **0.679**|

The detailed statistics are available at `exp/Brain-LogPPT.csv` etc.

For Brain-LogPPT, we've also attached the detailed 5 independent runs at `exp/runs-brain-logppt/0.csv` etc.

We can get the aggregate metric values simply by running 
```bash
python average-runs.py 5 results.csv
```
within `exp/runs-brain-logppt` directory to get exactly the same results as those in `exp/Brain-LogPPT.csv`.

### Per-dataset results for Brain-LogPPT

Note: standard deviation within parentheses

| Dataset | Proxifier     | Linux           | Apache     | Zookeeper    | Hadoop         | HealthApp       | OpenStack   | HPC             | Mac             | OpenSSH        | Spark          | Thunderbird    | BGL           | HDFS          |
|:-------:|:----------------:|:-----------------:|:------------:|:--------------:|:----------------:|:-----------------:|:-------------:|:-----------------:|:-----------------:|:----------------:|:-----------------:|:----------------:|:----------------:|:---------------:|
| **GA**    | 0.521 (0.0)   | 0.8 (0.002)    | 0.997 (0.0)| 0.994 (0.0)  | 0.904 (0.013)  | 0.998 (0.0)     | 1.0 (0.0)   | 0.992 (0.001)   | 0.884 (0.011)   | 0.779 (0.0)    | 0.974 (0.001)  | 0.849 (0.003) | 0.946 (0.007)| 0.961 (0.0)  |
| **PA**    | 0.695 (0.012) | 0.479 (0.237)  | 0.971 (0.0)| 0.824 (0.032)| 0.445 (0.047)  | 0.994 (0.003)   | 0.408 (0.0) | 0.965 (0.05)    | 0.448 (0.029)   | 0.722 (0.0)    | 0.74 (0.16)    | 0.244 (0.041) | 0.684 (0.16) | 0.948 (0.0)  |
| **FGA**   | 0.737 (0.0)   | 0.796 (0.009)  | 0.949 (0.0)| 0.897 (0.0)  | 0.831 (0.026)  | 0.961 (0.001)   | 1.0 (0.0)   | 0.853 (0.045)   | 0.827 (0.005)   | 0.897 (0.037)  | 0.871 (0.019)  | 0.818 (0.005) | 0.883 (0.011)| 0.791 (0.0)  |
| **FTA**   | 0.695 (0.094) | 0.515 (0.018)  | 0.814 (0.0)| 0.771 (0.027)| 0.535 (0.015)  | 0.85 (0.008)    | 0.875 (0.0) | 0.822 (0.056)   | 0.397 (0.018)   | 0.902 (0.029)  | 0.583 (0.018)  | 0.41 (0.013)  | 0.687 (0.006)| 0.651 (0.0)  |


## How to reproduce (for Loghub-2.0 only)

**Step 1 (Prepare `full_dataset`)**

As indicated in Loghub-2.0 repo:
1. Download the full datasets via [Zenodo](https://zenodo.org/record/8275861)
2. Unzip the full datasets into `full_dataset`
```
├── full_dataset/
    ├── post_process.py # (Loghub-2.0) we provide the heuristic roles used in our annotation of templates
    ├── BGL
        ├── BGL_full.log
        ├── BGL_full.log_structured.csv
        ├── BGL_full.log_templates.csv
```
Besides, to get the pre-trained RoBERTa base model (for LogPPT), please run 
```bash
./download.sh
```
within `benchmark/LogPPT/pretrained_models/roberta-base`

**Step 2 (Brain)**
```bash
cd benchmark/Brain-exp  
bash run-Brain-full.sh 
```

**Step 3 (LogPPT)**[^1]
```bash
cd benchmark/LogPPT
bash run-full-brain-sample.sh
```

**Step 4 (Brain-LogPPT)**
```bash
cd benchmark/Brain-LogPPT
bash brain-logppt-full.sh
```

## 🔥 Citation
+ Yu, Siyu, et al. "Brain: Log parsing with bidirectional parallel tree." IEEE Transactions on Services Computing 16.5 (2023): 3224-3237.
+ Le, Van-Hoang, and Hongyu Zhang. "Log parsing with prompt-based few-shot learning." 2023 IEEE/ACM 45th International Conference on Software Engineering (ICSE). IEEE, 2023.
+ Jiang, Zhihan, et al. "A large-scale evaluation for log parsing techniques: How far are we?." Proceedings of the 33rd ACM SIGSOFT International Symposium on Software Testing and Analysis. 2024.
+ Zhu, Jieming, et al. "Loghub: A large collection of system log datasets for ai-driven log analytics." 2023 IEEE 34th International Symposium on Software Reliability Engineering (ISSRE). IEEE, 2023.

[^1]: Also, it would automatically construct the optimized few-shot examples in the script.
