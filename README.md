# [TRAINING]

The goal of training is to make reuseable software for JHN internal use to read requested ICPCs and ATC from the aanvraag_specificatie.xlsx with SAS instead of hard copy them into study queries;

Installation

## Prerequisites:
- SAS V9.4
- filled aanvraag_specificatie.xlsx (a blank template is stored in /docs, a mock template is stored in /data/raw)

## Project configuration:
1. Unpack the zip on your machine. 
2. place your study specific aanvragen_specificatie.xlsx into the folder /data/raw.
3. Start SAS.
4. Open /config/start_training. 
5. Adjust the paths to the files. 
6. Run start.sas.
 

## Project organization
- PG = project-generated
- HW = human-writable
- RO = read only
```
.
├── .gitignore
├── CITATION.md
├── LICENSE.md
├── README.md
├── requirements.txt
├── bin                <- Compiled and external code, ignored by git (PG)
│   └── external       <- Any external source code, ignored by git (RO)
├── config             <- Configuration files (HW)
├── data               <- All project data, ignored by git
│   ├── processed      <- The final, canonical data sets for modeling. (PG)
│   ├── raw            <- The original, immutable data dump. (RO)
│   └── temp           <- Intermediate data that has been transformed. (PG)
├── docs               <- Documentation notebook for users (HW)
│   ├── manuscript     <- Manuscript source, e.g., LaTeX, Markdown, etc. (HW)
│   └── reports        <- Other project reports and notebooks (e.g. Jupyter, .Rmd) (HW)
├── results
│   ├── figures        <- Figures for the manuscript or reports (PG)
│   └── output         <- Other output for the manuscript or reports (PG)
└── src                <- Source code for this project (HW)

```


## License

This project is licensed under the terms of the [MIT License](/LICENSE.md)
