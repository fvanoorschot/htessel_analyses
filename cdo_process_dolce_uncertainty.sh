#!/bin/bash

# DOLCE V3 EVAPORATION
fol=~/work/fransje/DATA/DOLCE/v3
mkdir -p ${fol}/processed
fol_out=${fol}/processed

cdo -selvar,hfls_sd ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_uncertainty.nc
cdo -selvar,hfls_sd ${fol_out}/E_DOLCE_v3_monthly_1999_2018_climatology.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_climatology_uncertainty.nc

cdo mul ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_uncertainty2.nc
cdo mul ${fol_out}/E_DOLCE_v3_monthly_1999_2018_climatology_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_climatology_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_climatology_uncertainty2.nc

cdo add ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_uncertainty2.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_climatology_uncertainty2.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_uncertainty2.nc
cdo sqrt ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_uncertainty2.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_uncertainty.nc

cdo -selvar,hfls_sd ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_uncertainty.nc
cdo -selvar,hfls_sd ${fol_out}/E_DOLCE_v3_monthly_1993_2018_climatology.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_climatology_uncertainty.nc

cdo mul ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_uncertainty2.nc
cdo mul ${fol_out}/E_DOLCE_v3_monthly_1993_2018_climatology_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_climatology_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_climatology_uncertainty2.nc

cdo add ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_uncertainty2.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_climatology_uncertainty2.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_uncertainty2.nc
cdo sqrt ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_uncertainty2.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_uncertainty.nc

# DOLCE V3 EVAPORATION - UNCERTAINTY2
cdo -selvar,hfls ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls.nc
cdo -selvar,hfls ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_hfls.nc
cdo div ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_funcertainty.nc
cdo abs ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_hfls.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_hfls_abs.nc
cdo mul ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_funcertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_hfls_abs.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_ia_anomalies_uncertainty2.nc

cdo -selvar,hfls ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls.nc
cdo -selvar,hfls ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_hfls.nc
cdo div ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_funcertainty.nc
cdo abs ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_hfls.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_hfls_abs.nc
cdo mul ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_funcertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_hfls_abs.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_ia_anomalies_uncertainty2.nc

# DOLCE V3 EVAPORATION - UNCERTAINTY - 3 
cdo -selvar,hfls ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls.nc
cdo add ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls_up.nc
cdo sub ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls_um.nc

cdo ymonmean ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls_up.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls_up_climatology.nc
cdo ymonmean ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls_um.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls_um_climatology.nc
cdo sub ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls_up.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls_up_climatology.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_up_ia_anomalies_uncertainty3.nc
cdo sub ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls_um.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_fullfield_hfls_um_climatology.nc ${fol_out}/E_DOLCE_v3_monthly_1999_2018_um_ia_anomalies_uncertainty3.nc

cdo -selvar,hfls ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls.nc
cdo add ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls_up.nc
cdo sub ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_uncertainty.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls_um.nc

cdo ymonmean ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls_up.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls_up_climatology.nc
cdo ymonmean ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls_um.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls_um_climatology.nc
cdo sub ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls_up.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls_up_climatology.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_up_ia_anomalies_uncertainty3.nc
cdo sub ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls_um.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_fullfield_hfls_um_climatology.nc ${fol_out}/E_DOLCE_v3_monthly_1993_2018_um_ia_anomalies_uncertainty3.nc
