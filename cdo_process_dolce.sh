#!/bin/bash

# DOLCE V3 EVAPORATION
fol=~/work/fransje/DATA/DOLCE/v3
mkdir -p ${fol}/processed
fol_out=${fol}/processed
file=${fol_out}/DOLCE_v3_1980_2018.nc

mkdir -p ${fol}/tmp

#selyears 1999-2018
cdo -selyear,1999/2018 $file ${fol_out}/DOLCE_v3_1999_2018.nc

#change grid
cdo -b F32 -f nc4 remapcon,n128 ${fol_out}/DOLCE_v3_1999_2018.nc ${fol_out}/E_DOLCE_v3_T255_1999_2018.nc

#select variable
cdo -selname,hfls,hfls_sd -setday,15 -settime,00:00:00 ${fol_out}/E_DOLCE_v3_T255_1999_2018.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield.nc

#set negative to zero
#cdo -setrtoc,-1000,0,0 ${fol_out}/E_DOLCE_v3_monthly_1999_2018.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield.nc

# climatology
cdo ymonmean ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_climatology.nc
cdo ymonstd ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdclimatology.nc

#uncertainty
cdo -selvar,hfls_sd ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_uncertainty.nc
cdo -selvar,hfls ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdclimatology.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdclimatology_hfls.nc
cdo div ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdclimatology_hfls.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_stduncertainty.nc

# inter annual anomalies
cdo sub ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_climatology.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies.nc
cdo div ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdclimatology.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdia_anomalies.nc

# seasons
cdo delete,timestep=1,2,-1 ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_del.nc
cdo seasmean ${fol_out}/E_DOLCE_v3_monthly_1999_2018_del.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_seasonal.nc
cdo -selmonth,4 ${fol_out}/E_DOLCE_v3_monthly_1999_2018_seasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_mam.nc
cdo -selmonth,7 ${fol_out}/E_DOLCE_v3_monthly_1999_2018_seasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_jja.nc
cdo -selmonth,10 ${fol_out}/E_DOLCE_v3_monthly_1999_2018_seasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_son.nc
cdo -selmonth,1 ${fol_out}/E_DOLCE_v3_monthly_1999_2018_seasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_djf.nc

cdo yseasstd ${fol_out}/E_DOLCE_v3_monthly_1999_2018_del.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdseasonal.nc
cdo -selmonth,5 ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdseasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdmam.nc
cdo -selmonth,8 ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdseasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdjja.nc
cdo -selmonth,11 ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdseasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdson.nc
cdo -selmonth,2 ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdseasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stddjf.nc

#seasonal anomalies
cdo timmean ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_djf.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_djf_mean.nc
cdo sub ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_djf.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_djf_mean.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_djf.nc

cdo timmean ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_mam.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_mam_mean.nc
cdo sub ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_mam.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_mam_mean.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_mam.nc

cdo timmean ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_jja.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_jja_mean.nc
cdo sub ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_jja.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_jja_mean.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_jja.nc

cdo timmean ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_son.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_son_mean.nc
cdo sub ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_son.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_son_mean.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_son.nc

#seasonal standardized anomalies
cdo div ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_son.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdson.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdia_anomalies_son.nc
cdo div ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_djf.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stddjf.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdia_anomalies_djf.nc
cdo div ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_jja.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdjja.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdia_anomalies_jja.nc
cdo div ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_mam.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdmam.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdia_anomalies_mam.nc

# #selyears 1993-2018
# cdo -selyear,1993/2018 $file ${fol_out}/DOLCE_v3_1993_2018.nc

# #change grid
# cdo -b F32 -f nc4 remapcon,n128 ${fol_out}/DOLCE_v3_1993_2018.nc ${fol_out}/E_DOLCE_v3_T255_1993_2018.nc

# #select variable
# cdo -selname,hfls,hfls_sd -setday,15 -settime,00:00:00 ${fol_out}/E_DOLCE_v3_T255_1993_2018.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield.nc

# #set negative to zero
# #cdo -setrtoc,-1000,0,0 ${fol_out}/E_DOLCE_v3_monthly_1993_2018.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield.nc

# # climatology
# cdo ymonmean ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_climatology.nc
# cdo ymonstd ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdclimatology.nc

# # inter annual anomalies
# cdo sub ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_climatology.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies.nc
# cdo div ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdclimatology.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdia_anomalies.nc

# # fluxmask
# cdo -div ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield.nc ~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/1993_2018_fluxcom_mask.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_fluxmask.nc
# cdo -div ${fol_out}/E_DOLCE_v3_monthly_1993_2018_climatology.nc ~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/1993_2018_fluxcom_mask.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_climatology_fluxmask.nc
# cdo -div ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies.nc ~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/1993_2018_fluxcom_mask.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_fluxmask.nc

# # seasons
# cdo delete,timestep=1,2,-1 ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_del.nc
# cdo seasmean ${fol_out}/E_DOLCE_v3_monthly_1993_2018_del.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_seasonal.nc
# cdo -selmonth,4 ${fol_out}/E_DOLCE_v3_monthly_1993_2018_seasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_mam.nc
# cdo -selmonth,7 ${fol_out}/E_DOLCE_v3_monthly_1993_2018_seasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_jja.nc
# cdo -selmonth,10 ${fol_out}/E_DOLCE_v3_monthly_1993_2018_seasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_son.nc
# cdo -selmonth,1 ${fol_out}/E_DOLCE_v3_monthly_1993_2018_seasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_djf.nc

# cdo yseasstd ${fol_out}/E_DOLCE_v3_monthly_1993_2018_del.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdseasonal.nc
# cdo -selmonth,5 ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdseasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdmam.nc
# cdo -selmonth,8 ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdseasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdjja.nc
# cdo -selmonth,11 ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdseasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdson.nc
# cdo -selmonth,2 ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdseasonal.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stddjf.nc

# #seasonal anomalies
# cdo timmean ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_djf.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_djf_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_djf.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_djf_mean.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_djf.nc

# cdo timmean ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_mam.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_mam_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_mam.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_mam_mean.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_mam.nc

# cdo timmean ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_jja.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_jja_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_jja.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_jja_mean.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_jja.nc

# cdo timmean ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_son.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_son_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_son.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_son_mean.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_son.nc

# #seasonal standardized anomalies
# cdo div ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_son.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdson.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdia_anomalies_son.nc
# cdo div ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_djf.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stddjf.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdia_anomalies_djf.nc
# cdo div ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_jja.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdjja.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdia_anomalies_jja.nc
# cdo div ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_mam.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_stdmam.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_stdia_anomalies_mam.nc


# #selyears 2000-2018
# cdo -selyear,2000/2018 $file ${fol_out}/DOLCE_v3_2000_2018.nc

# #change grid
# cdo -b F32 -f nc4 remapcon,n128 ${fol_out}/DOLCE_v3_2000_2018.nc ${fol_out}/E_DOLCE_v3_T255_2000_2018.nc

# #select variable
# cdo -selname,hfls,hfls_sd -setday,15 -settime,00:00:00 ${fol_out}/E_DOLCE_v3_T255_2000_2018.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield.nc

# #set negative to zero
# # cdo -setrtoc,-1000,0,0 ${fol_out}/E_DOLCE_v3_monthly_2000_2018.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield.nc

# # climatology
# cdo ymonmean ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_climatology.nc

# # inter annual anomalies
# cdo sub ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_climatology.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_ia_anomalies.nc

# # fluxmask
# cdo -div ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield.nc ~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/2000_2018_fluxcom_mask.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_fluxmask.nc
# cdo -div ${fol_out}/E_DOLCE_v3_monthly_2000_2018_climatology.nc ~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/2000_2018_fluxcom_mask.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_climatology_fluxmask.nc
# cdo -div ${fol_out}/E_DOLCE_v3_monthly_2000_2018_ia_anomalies.nc ~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/2000_2018_fluxcom_mask.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_ia_anomalies_fluxmask.nc

# # seasons
# cdo delete,timestep=1,2,-1 ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_del.nc
# cdo seasmean ${fol_out}/E_DOLCE_v3_monthly_2000_2018_del.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_seasonal.nc
# cdo -selmonth,4 ${fol_out}/E_DOLCE_v3_monthly_2000_2018_seasonal.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_mam.nc
# cdo -selmonth,7 ${fol_out}/E_DOLCE_v3_monthly_2000_2018_seasonal.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_jja.nc
# cdo -selmonth,10 ${fol_out}/E_DOLCE_v3_monthly_2000_2018_seasonal.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_son.nc
# cdo -selmonth,1 ${fol_out}/E_DOLCE_v3_monthly_2000_2018_seasonal.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_djf.nc

# #seasonal anomalies
# cdo timmean ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_djf.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_djf_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_djf.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_djf_mean.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_ia_anomalies_djf.nc

# cdo timmean ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_mam.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_mam_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_mam.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_mam_mean.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_ia_anomalies_mam.nc

# cdo timmean ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_jja.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_jja_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_jja.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_jja_mean.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_ia_anomalies_jja.nc

# cdo timmean ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_son.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_son_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_son.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_fullfield_son_mean.nc ${fol_out}/E_DOLCE_v3_monthly_2000_2018_ia_anomalies_son.nc

# # DOLCE V2-1 EVAPORATION
# fol=~/work/fransje/DATA/DOLCE/v2-1
# mkdir -p ${fol}/processed
# fol_out=${fol}/processed
# file=${fol_out}/DOLCE_v2-1_1980_2018.nc

# mkdir -p ${fol}/tmp

# #selyears 1993-2018
# cdo -selyear,1993/2018 $file ${fol_out}/DOLCE_v2-1_1993_2018.nc

# #change grid
# cdo -b F32 -f nc4 remapcon,n128 ${fol_out}/DOLCE_v2-1_1993_2018.nc ${fol_out}/E_DOLCE_v2-1_T255_1993_2018.nc

# #select variable
# cdo -selname,hfls -setday,15 -settime,00:00:00 ${fol_out}/E_DOLCE_v2-1_T255_1993_2018.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018.nc

# #set negative to zero
# cdo -setrtoc,-1000,0,0 ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield.nc

# # climatology
# cdo ymonmean ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_climatology.nc

# # inter annual anomalies
# cdo sub ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_climatology.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_ia_anomalies.nc

# # fluxmask
# cdo -div ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield.nc ~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/1993_2018_fluxcom_mask.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_fluxmask.nc
# cdo -div ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_climatology.nc ~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/1993_2018_fluxcom_mask.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_climatology_fluxmask.nc
# cdo -div ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_ia_anomalies.nc ~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/1993_2018_fluxcom_mask.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_ia_anomalies_fluxmask.nc

# # seasons
# cdo delete,timestep=1,2,-1 ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_del.nc
# cdo seasmean ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_del.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_seasonal.nc
# cdo -selmonth,4 ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_seasonal.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_mam.nc
# cdo -selmonth,7 ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_seasonal.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_jja.nc
# cdo -selmonth,10 ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_seasonal.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_son.nc
# cdo -selmonth,1 ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_seasonal.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_djf.nc

# #seasonal anomalies
# cdo timmean ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_djf.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_djf_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_djf.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_djf_mean.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_ia_anomalies_djf.nc

# cdo timmean ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_mam.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_mam_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_mam.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_mam_mean.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_ia_anomalies_mam.nc

# cdo timmean ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_jja.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_jja_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_jja.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_jja_mean.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_ia_anomalies_jja.nc

# cdo timmean ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_son.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_son_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_son.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_fullfield_son_mean.nc ${fol_out}/E_DOLCE_v2-1_monthly_1993_2018_ia_anomalies_son.nc

# #selyears 2000-2018
# cdo -selyear,2000/2018 $file ${fol_out}/DOLCE_v2-1_2000_2018.nc

# #change grid
# cdo -b F32 -f nc4 remapcon,n128 ${fol_out}/DOLCE_v2-1_2000_2018.nc ${fol_out}/E_DOLCE_v2-1_T255_2000_2018.nc

# #select variable
# cdo -selname,hfls -setday,15 -settime,00:00:00 ${fol_out}/E_DOLCE_v2-1_T255_2000_2018.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018.nc

# #set negative to zero
# cdo -setrtoc,-1000,0,0 ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield.nc

# # climatology
# cdo ymonmean ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_climatology.nc

# # inter annual anomalies
# cdo sub ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_climatology.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_ia_anomalies.nc

# # fluxmask
# cdo -div ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield.nc ~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/2000_2018_fluxcom_mask.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_fluxmask.nc
# cdo -div ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_climatology.nc ~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/2000_2018_fluxcom_mask.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_climatology_fluxmask.nc
# cdo -div ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_ia_anomalies.nc ~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/2000_2018_fluxcom_mask.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_ia_anomalies_fluxmask.nc

# # seasons
# cdo delete,timestep=1,2,-1 ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_del.nc
# cdo seasmean ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_del.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_seasonal.nc
# cdo -selmonth,4 ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_seasonal.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_mam.nc
# cdo -selmonth,7 ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_seasonal.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_jja.nc
# cdo -selmonth,10 ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_seasonal.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_son.nc
# cdo -selmonth,1 ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_seasonal.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_djf.nc

# #seasonal anomalies
# cdo timmean ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_djf.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_djf_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_djf.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_djf_mean.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_ia_anomalies_djf.nc

# cdo timmean ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_mam.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_mam_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_mam.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_mam_mean.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_ia_anomalies_mam.nc

# cdo timmean ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_jja.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_jja_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_jja.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_jja_mean.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_ia_anomalies_jja.nc

# cdo timmean ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_son.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_son_mean.nc
# cdo sub ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_son.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_fullfield_son_mean.nc ${fol_out}/E_DOLCE_v2-1_monthly_2000_2018_ia_anomalies_son.nc
