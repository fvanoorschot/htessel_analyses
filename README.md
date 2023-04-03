This repository contains all the scripts used to analyse the offline HTESSEL model output.

### 1. post process the model output (requires CDO https://code.mpimet.mpg.de/projects/cdo)
- cdo_process_output_allyears.sh
- cdo_process_output_selyear.sh

### 2. process reference data (requires CDO https://code.mpimet.mpg.de/projects/cdo)
- cdo_process_dolce.sh
- cdo_process_dolce_uncertainty.sh
- cdo_process_refdata.sh
- process_sm.sh
- mask_sm.sh

### 3. analyse model output (uses ewatercycle python env https://ewatercycle.readthedocs.io/en/latest/system_setup.html#conda-environment)
Functions:
- f_preprocessing.py
- f_significance_calculation.py
- f_significance_calculation_rmse.py
- f_statistics.py
- fitting_functions.py
- run_sig.py
- run_sig_rmse.py

Prepare figures:
- paper_figures_lc.ipynb
- paper_figures_lai.ipynb
- paper_figures_fcover.ipynb
- paper_figures_feedbacks.ipynb
- paper_figures_drought.ipynb
- paper_figures_corr_maps.ipynb
- global_et_es_ei.ipynb
