import numpy as np
import matplotlib.pyplot as plt
import cartopy.crs as ccrs
import pandas as pd
import xarray as xr
import os
import iris
import iris.analysis.cartography
import iris.plot as iplt
import iris.coord_categorisation
import iris.analysis.stats

from f_statistics import *
from f_preprocessing import *
from f_figures import *
from f_run_evaluation import *
from f_vegstats import *
from f_significance_calculation import *

fol='/home/vanoorschot/work/fransje'

# EVAPORATION INTER ANNUAL ANOMALIES - 1999-2018
# for dt in ['dt_no']:#,'dt_no']:
#     ref_data = 'DOLCE_v3'
#     start_year = '1999'
#     end_year = '2018'
#     var = 'hfls'

#     exp_name1 = 'exp3'
#     exp_name2 = 'ex10'
#     tp = 'ia anomalies'

#     reps=1000
#     run_significance(exp_name1, exp_name2, tp, start_year, end_year, ref_data, fol, reps,dt) #save quantiles

# # EVAPORATION INTER ANNUAL ANOMALIES - 1993-2018
# for dt in ['dt_yes','dt_no']:
#     ref_data = 'DOLCE_v3'
#     start_year = '1993'
#     end_year = '2018'
#     var = 'hfls'

#     exp_name1 = 'ex10'
#     exp_name2 = 'exp5'
#     tp = 'ia anomalies'

#     reps=1000
#     run_significance(exp_name1, exp_name2, tp, start_year, end_year, ref_data, fol, reps,dt) #save quantiles

# # EVAPORATION SEASONAL INTER ANNUAL ANOMALIES - 1999-2018
# for dt in ['dt_no']:#,'dt_no']:
#     ref_data = 'DOLCE_v3'
#     start_year = '1999'
#     end_year = '2018'
#     var = 'hfls'

#     exp_name1 = 'exp3'
#     exp_name2 = 'ex10'
#     tp = 'ia anomalies jja'
#     season='jja'

#     reps=1000
#     run_significance_seasons(exp_name1, exp_name2, tp, start_year, end_year, ref_data, fol, reps,season,dt) #save quantiles

#     # DJF
#     ref_data = 'DOLCE_v3'
#     start_year = '1999'
#     end_year = '2018'
#     var = 'hfls'

#     exp_name1 = 'exp3'
#     exp_name2 = 'ex10'
#     tp = 'ia anomalies djf'
#     season='djf'

#     reps=1000
#     run_significance_seasons(exp_name1, exp_name2, tp, start_year, end_year, ref_data, fol, reps,season,dt) #save quantiles

#     # SON
#     ref_data = 'DOLCE_v3'
#     start_year = '1999'
#     end_year = '2018'
#     var = 'hfls'

#     exp_name1 = 'exp3'
#     exp_name2 = 'ex10'
#     tp = 'ia anomalies son'
#     season='son'

#     reps=1000
#     run_significance_seasons(exp_name1, exp_name2, tp, start_year, end_year, ref_data, fol, reps,season,dt) #save quantiles

#     # MAM
#     ref_data = 'DOLCE_v3'
#     start_year = '1999'
#     end_year = '2018'
#     var = 'hfls'

#     exp_name1 = 'exp3'
#     exp_name2 = 'ex10'
#     tp = 'ia anomalies mam'
#     season='mam'

#     reps=1000
#     run_significance_seasons(exp_name1, exp_name2, tp, start_year, end_year, ref_data, fol, reps,season,dt) #save quantiles

# # EVAPORATION SEASONAL INTER ANNUAL ANOMALIES - 1993-2018
# for dt in ['dt_yes']:#,'dt_no']:
#     # JJA
#     ref_data = 'DOLCE_v3'
#     start_year = '1993'
#     end_year = '2018'
#     var = 'hfls'

#     exp_name1 = 'ex10'
#     exp_name2 = 'exp5'
#     tp = 'ia anomalies jja'
#     season='jja'

#     reps=1000
#     run_significance_seasons(exp_name1, exp_name2, tp, start_year, end_year, ref_data, fol, reps,season,dt) #save quantiles

#     # DJF
#     ref_data = 'DOLCE_v3'
#     start_year = '1993'
#     end_year = '2018'
#     var = 'hfls'

#     exp_name1 = 'ex10'
#     exp_name2 = 'exp5'
#     tp = 'ia anomalies djf'
#     season='djf'

#     reps=1000
#     run_significance_seasons(exp_name1, exp_name2, tp, start_year, end_year, ref_data, fol, reps,season,dt) #save quantiles

#     # SON
#     ref_data = 'DOLCE_v3'
#     start_year = '1993'
#     end_year = '2018'
#     var = 'hfls'

#     exp_name1 = 'ex10'
#     exp_name2 = 'exp5'
#     tp = 'ia anomalies son'
#     season='son'

#     reps=1000
#     run_significance_seasons(exp_name1, exp_name2, tp, start_year, end_year, ref_data, fol, reps,season,dt) #save quantiles

#     # MAM
#     ref_data = 'DOLCE_v3'
#     start_year = '1993'
#     end_year = '2018'
#     var = 'hfls'

#     exp_name1 = 'ex10'
#     exp_name2 = 'exp5'
#     tp = 'ia anomalies mam'
#     season='mam'

#     reps=1000
#     run_significance_seasons(exp_name1, exp_name2, tp, start_year, end_year, ref_data, fol, reps,season,dt) #save quantiles


# # SOIL MOISTURE INTER ANNUAL ANOMALIES - 1993 -2018
# for dt in ['dt_yes','dt_no']:

#     start_year = '1993'
#     end_year = '2018'
#     exp_name1 = 'ex10'
#     exp_name2 = 'exp5'
#     tp = 'ia anomalies'
#     reps=1000
#     th='60'

#     layer='layer1'
#     run_significance_SM_esa(exp_name1, exp_name2, tp, start_year, end_year,fol, reps, layer,dt,th) #save quantiles

#SOIL MOISTURE INTER ANNUAL ANOMALIES - 1999 -2018
for dt in ['dt_yes']:

    start_year = '1999'
    end_year = '2018'
    exp_name1 = 'exp3'
    exp_name2 = 'exp6'
    tp = 'ia anomalies'
    reps=1000
    th='60'

    layer='layer1'
    run_significance_SM_esa(exp_name1, exp_name2, tp, start_year, end_year,fol, reps, layer,dt,th) #save quantiles

# # SOIL MOISTURE INTER ANNUAL ANOMALIES - 1993 -2018 - seasons
# for dt in ['dt_yes','dt_no']:

#     start_year = '1993'
#     end_year = '2018'
#     exp_name1 = 'ex10'
#     exp_name2 = 'exp5'
#     tp = 'ia anomalies'
#     reps=1000
#     season='djf'
#     th='60'

#     layer='layer1'
#     run_significance_SM_esa_seasons(exp_name1, exp_name2, tp, start_year, end_year,fol, reps, layer,season,dt,th) #save quantiles


# for dt in ['dt_yes','dt_no']:

#     start_year = '1993'
#     end_year = '2018'
#     exp_name1 = 'ex10'
#     exp_name2 = 'exp5'
#     tp = 'ia anomalies'
#     reps=1000
#     season='jja'
#     th='60'

#     layer='layer1'
#     run_significance_SM_esa_seasons(exp_name1, exp_name2, tp, start_year, end_year,fol, reps, layer,season,dt,th) #save quantiles

# for dt in ['dt_yes','dt_no']:

#     start_year = '1993'
#     end_year = '2018'
#     exp_name1 = 'ex10'
#     exp_name2 = 'exp5'
#     tp = 'ia anomalies'
#     reps=1000
#     season='son'
#     th='60'

#     layer='layer1'
#     run_significance_SM_esa_seasons(exp_name1, exp_name2, tp, start_year, end_year,fol, reps, layer,season,dt,th) #save quantiles


# for dt in ['dt_yes','dt_no']:

#     start_year = '1993'
#     end_year = '2018'
#     exp_name1 = 'ex10'
#     exp_name2 = 'exp5'
#     tp = 'ia anomalies'
#     reps=1000
#     season='mam'
#     th='60'

#     layer='layer1'
#     run_significance_SM_esa_seasons(exp_name1, exp_name2, tp, start_year, end_year,fol, reps, layer,season,dt,th) #save quantiles

#SOIL MOISTURE INTER ANNUAL ANOMALIES - 1999 -2018 - seasons
for dt in ['dt_yes']:

   start_year = '1999'
   end_year = '2018'
   exp_name1 = 'exp3'
   exp_name2 = 'exp6'
   tp = 'ia anomalies'
   reps=1000
   season='djf'
   th='60'

   layer='layer1'
   run_significance_SM_esa_seasons(exp_name1, exp_name2, tp, start_year, end_year,fol, reps, layer,season,dt,th) #save quantiles


for dt in ['dt_yes']:

   start_year = '1999'
   end_year = '2018'
   exp_name1 = 'exp3'
   exp_name2 = 'exp6'
   tp = 'ia anomalies'
   reps=1000
   season='jja'
   th='60'

   layer='layer1'
   run_significance_SM_esa_seasons(exp_name1, exp_name2, tp, start_year, end_year,fol, reps, layer,season,dt,th) #save quantiles

for dt in ['dt_yes']:

   start_year = '1999'
   end_year = '2018'
   exp_name1 = 'exp3'
   exp_name2 = 'exp6'
   tp = 'ia anomalies'
   reps=1000
   season='son'
   th='60'

   layer='layer1'
   run_significance_SM_esa_seasons(exp_name1, exp_name2, tp, start_year, end_year,fol, reps, layer,season,dt,th) #save quantiles


for dt in ['dt_yes']:

   start_year = '1999'
   end_year = '2018'
   exp_name1 = 'exp3'
   exp_name2 = 'exp6'
   tp = 'ia anomalies'
   reps=1000
   season='mam'
   th='60'

   layer='layer1'
   run_significance_SM_esa_seasons(exp_name1, exp_name2, tp, start_year, end_year,fol, reps, layer,season,dt,th) #save quantiles
