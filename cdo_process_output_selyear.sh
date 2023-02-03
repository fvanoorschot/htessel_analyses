#!/bin/bash

fol=~/work/fransje/htessel_output

# different start and end years depending on reference data
ref_data="DOLCE"

if [ $ref_data = "somo" ] 
then 
#fcover
#year_start=1999
year_start=2000
year_end=2019
fi


if [ $ref_data = "albedo" ] 
then 
#fcover
year_start=1993
year_end=2015
fi

if [ $ref_data = "fcover" ] 
then 
#fcover
#year_start=1999
year_start=1993
year_end=2019
fi

if [ $ref_data = "FLUXCOM_RSMETEO_GSWP3" ] 
then 
#FLUXCOM RSMETEO GSWP3
year_start=1999
year_end=2014
fi

if [ $ref_data = "FLUXCOM_RS" ]
then 
#FLUXCOM RS
year_start=2001
year_end=2015
fi

if [ $ref_data = "GLEAM_V3.5b" ]
then 
#GLEAM V3.5b
year_start=2003
year_end=2019
fi

if [ $ref_data = "ERA5" ]
then 
#ERA5
year_start=1993
year_end=2019
fi

if [ $ref_data = "CLASS" ]
then 
#CLASS
year_start=2003
year_end=2009
fi

if [ $ref_data = "ENSEMBLE_CHANDRAKANT" ]
then 
#ENSEMBLE CHANDRAKANT
year_start=2001
year_end=2012
fi

if [ $ref_data = "DOLCE" ]
then 
#DOLCE V3 AND V2-1
year_start=1999
year_end=2018
fi

if [ $ref_data = "DOLCE2" ]
then 
#DOLCE V3 AND V2-1
year_start=2000
year_end=2018
fi

#make array from start year to end year
# array=( $(seq $year_start 1 $year_end) )
array=( $(seq 1999 1 2018) )

# run for all experiments
for exp_name in exp3 ex10 #ex11 #exp1 exp2 exp3 exp4 exp5 exp6 exp7 exp8 exp9
do

# monthly means for selected years
cdo -selyear,${year_start}/${year_end} ${fol}/${exp_name}/monthly/o_wat_1980_2019_monthly.nc ${fol}/${exp_name}/monthly/o_wat_${year_start}_${year_end}_monthly.nc
cdo -selyear,${year_start}/${year_end} ${fol}/${exp_name}/monthly/o_veg_1980_2019_monthly.nc ${fol}/${exp_name}/monthly/o_veg_${year_start}_${year_end}_monthly.nc
cdo -selyear,${year_start}/${year_end} ${fol}/${exp_name}/monthly/o_tmp_1980_2019_monthly.nc ${fol}/${exp_name}/monthly/o_tmp_${year_start}_${year_end}_monthly.nc
cdo -selyear,${year_start}/${year_end} ${fol}/${exp_name}/monthly/o_efl_1980_2019_monthly.nc ${fol}/${exp_name}/monthly/o_efl_${year_start}_${year_end}_monthly.nc
cdo -selyear,${year_start}/${year_end} ${fol}/${exp_name}/monthly/o_oth_1980_2019_monthly.nc ${fol}/${exp_name}/monthly/o_oth_${year_start}_${year_end}_monthly.nc
cdo -selyear,${year_start}/${year_end} ${fol}/${exp_name}/monthly/o_snow_1980_2019_monthly.nc ${fol}/${exp_name}/monthly/o_snow_${year_start}_${year_end}_monthly.nc
cdo -selyear,${year_start}/${year_end} ${fol}/${exp_name}/monthly/o_soil_1980_2019_monthly.nc ${fol}/${exp_name}/monthly/o_soil_${year_start}_${year_end}_monthly.nc

# set negative E to zero (here positive)
#cdo -setrtoc,0,100000000,0 ${fol}/${exp_name}/monthly/o_efl_${year_start}_${year_end}_monthly_p.nc ${fol}/${exp_name}/monthly/o_efl_${year_start}_${year_end}_monthly.nc

# climatology
cdo ymonmean ${fol}/${exp_name}/monthly/o_wat_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_wat_${year_start}_${year_end}_climatology.nc
cdo ymonmean ${fol}/${exp_name}/monthly/o_veg_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_veg_${year_start}_${year_end}_climatology.nc
cdo ymonmean ${fol}/${exp_name}/monthly/o_tmp_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_tmp_${year_start}_${year_end}_climatology.nc
cdo ymonmean ${fol}/${exp_name}/monthly/o_efl_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_efl_${year_start}_${year_end}_climatology.nc
cdo ymonmean ${fol}/${exp_name}/monthly/o_oth_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_oth_${year_start}_${year_end}_climatology.nc
cdo ymonmean ${fol}/${exp_name}/monthly/o_snow_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_snow_${year_start}_${year_end}_climatology.nc
cdo ymonmean ${fol}/${exp_name}/monthly/o_soil_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_soil_${year_start}_${year_end}_climatology.nc

# climatologystd
cdo ymonstd ${fol}/${exp_name}/monthly/o_wat_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_wat_${year_start}_${year_end}_stdclimatology.nc
cdo ymonstd ${fol}/${exp_name}/monthly/o_veg_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_veg_${year_start}_${year_end}_stdclimatology.nc
cdo ymonstd ${fol}/${exp_name}/monthly/o_tmp_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_tmp_${year_start}_${year_end}_stdclimatology.nc
cdo ymonstd ${fol}/${exp_name}/monthly/o_efl_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_efl_${year_start}_${year_end}_stdclimatology.nc
cdo ymonstd ${fol}/${exp_name}/monthly/o_oth_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_oth_${year_start}_${year_end}_stdclimatology.nc
cdo ymonstd ${fol}/${exp_name}/monthly/o_snow_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_snow_${year_start}_${year_end}_stdclimatology.nc
cdo ymonstd ${fol}/${exp_name}/monthly/o_soil_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_soil_${year_start}_${year_end}_stdclimatology.nc

# seasons
for file in o_wat o_veg o_tmp o_efl o_oth o_snow o_soil
do 
cdo delete,timestep=1,2,-1 ${fol}/${exp_name}/monthly/${file}_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly/tmp/${file}_${year_start}_${year_end}_monthly_del.nc
cdo seasmean ${fol}/${exp_name}/monthly/tmp/${file}_${year_start}_${year_end}_monthly_del.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_seasonal.nc
cdo -selmonth,4 ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_seasonal.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_mam.nc
cdo -selmonth,7 ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_seasonal.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_jja.nc
cdo -selmonth,10 ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_seasonal.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_son.nc
cdo -selmonth,1 ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_seasonal.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_djf.nc

cdo yseasstd ${fol}/${exp_name}/monthly/tmp/${file}_${year_start}_${year_end}_monthly_del.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stdseasonal.nc
cdo -selmonth,5 ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stdseasonal.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stdmam.nc
cdo -selmonth,8 ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stdseasonal.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stdjja.nc
cdo -selmonth,11 ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stdseasonal.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stdson.nc
cdo -selmonth,2 ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stdseasonal.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stddjf.nc

#seasonal anomalies
cdo timmean ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_djf.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_djf_mean.nc
cdo sub ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_djf.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_djf_mean.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_djf_anomalies.nc

cdo timmean ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_mam.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_mam_mean.nc
cdo sub ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_mam.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_mam_mean.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_mam_anomalies.nc

cdo timmean ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_jja.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_jja_mean.nc
cdo sub ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_jja.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_jja_mean.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_jja_anomalies.nc

cdo timmean ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_son.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_son_mean.nc
cdo sub ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_son.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_son_mean.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_son_anomalies.nc

#seasonal standardized anomalies
cdo div ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_djf_anomalies.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stddjf.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_djf_stdanomalies.nc
cdo div ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_mam_anomalies.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stdmam.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_mam_stdanomalies.nc
cdo div ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_son_anomalies.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stdson.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_son_stdanomalies.nc
cdo div ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_jja_anomalies.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_stdjja.nc ${fol}/${exp_name}/seasonal/${file}_${year_start}_${year_end}_jja_stdanomalies.nc

done

# yearly mean
cdo yearmean ${fol}/${exp_name}/monthly/o_wat_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/yearly/o_wat_${year_start}_${year_end}_yearly.nc
cdo yearmean ${fol}/${exp_name}/monthly/o_veg_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/yearly/o_veg_${year_start}_${year_end}_yearly.nc
cdo yearmean ${fol}/${exp_name}/monthly/o_tmp_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/yearly/o_tmp_${year_start}_${year_end}_yearly.nc
cdo yearmean ${fol}/${exp_name}/monthly/o_efl_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/yearly/o_efl_${year_start}_${year_end}_yearly.nc
cdo yearmean ${fol}/${exp_name}/monthly/o_oth_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/yearly/o_oth_${year_start}_${year_end}_yearly.nc
cdo yearmean ${fol}/${exp_name}/monthly/o_snow_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/yearly/o_snow_${year_start}_${year_end}_yearly.nc
cdo yearmean ${fol}/${exp_name}/monthly/o_soil_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/yearly/o_soil_${year_start}_${year_end}_yearly.nc

# interannual anomalies
rm -rf ${fol}/${exp_name}/monthly_climatology/tmp/*
for year in "${array[@]}"
do
cdo -setyear,$year ${fol}/${exp_name}/monthly_climatology/o_wat_${year_start}_${year_end}_climatology.nc ${fol}/${exp_name}/monthly_climatology/tmp/o_wat_${year}_year_climatology.nc
cdo -setyear,$year ${fol}/${exp_name}/monthly_climatology/o_veg_${year_start}_${year_end}_climatology.nc ${fol}/${exp_name}/monthly_climatology/tmp/o_veg_${year}_year_climatology.nc
cdo -setyear,$year ${fol}/${exp_name}/monthly_climatology/o_efl_${year_start}_${year_end}_climatology.nc ${fol}/${exp_name}/monthly_climatology/tmp/o_efl_${year}_year_climatology.nc
cdo -setyear,$year ${fol}/${exp_name}/monthly_climatology/o_oth_${year_start}_${year_end}_climatology.nc ${fol}/${exp_name}/monthly_climatology/tmp/o_oth_${year}_year_climatology.nc
cdo -setyear,$year ${fol}/${exp_name}/monthly_climatology/o_tmp_${year_start}_${year_end}_climatology.nc ${fol}/${exp_name}/monthly_climatology/tmp/o_tmp_${year}_year_climatology.nc
cdo -setyear,$year ${fol}/${exp_name}/monthly_climatology/o_snow_${year_start}_${year_end}_climatology.nc ${fol}/${exp_name}/monthly_climatology/tmp/o_snow_${year}_year_climatology.nc
cdo -setyear,$year ${fol}/${exp_name}/monthly_climatology/o_soil_${year_start}_${year_end}_climatology.nc ${fol}/${exp_name}/monthly_climatology/tmp/o_soil_${year}_year_climatology.nc
done

cdo mergetime ${fol}/${exp_name}/monthly_climatology/tmp/o_wat_*_year_climatology.nc ${fol}/${exp_name}/monthly_climatology/o_wat_${year_start}_${year_end}_climatology_allyears.nc
cdo mergetime ${fol}/${exp_name}/monthly_climatology/tmp/o_veg_*_year_climatology.nc ${fol}/${exp_name}/monthly_climatology/o_veg_${year_start}_${year_end}_climatology_allyears.nc
cdo mergetime ${fol}/${exp_name}/monthly_climatology/tmp/o_efl_*_year_climatology.nc ${fol}/${exp_name}/monthly_climatology/o_efl_${year_start}_${year_end}_climatology_allyears.nc
cdo mergetime ${fol}/${exp_name}/monthly_climatology/tmp/o_oth_*_year_climatology.nc ${fol}/${exp_name}/monthly_climatology/o_oth_${year_start}_${year_end}_climatology_allyears.nc
cdo mergetime ${fol}/${exp_name}/monthly_climatology/tmp/o_tmp_*_year_climatology.nc ${fol}/${exp_name}/monthly_climatology/o_tmp_${year_start}_${year_end}_climatology_allyears.nc
cdo mergetime ${fol}/${exp_name}/monthly_climatology/tmp/o_snow_*_year_climatology.nc ${fol}/${exp_name}/monthly_climatology/o_snow_${year_start}_${year_end}_climatology_allyears.nc
cdo mergetime ${fol}/${exp_name}/monthly_climatology/tmp/o_soil_*_year_climatology.nc ${fol}/${exp_name}/monthly_climatology/o_soil_${year_start}_${year_end}_climatology_allyears.nc

cdo sub ${fol}/${exp_name}/monthly/o_wat_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_wat_${year_start}_${year_end}_climatology_allyears.nc ${fol}/${exp_name}/ia_anomalies/o_wat_${year_start}_${year_end}_ia_anomalies.nc

cdo sub ${fol}/${exp_name}/monthly/o_veg_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_veg_${year_start}_${year_end}_climatology_allyears.nc ${fol}/${exp_name}/ia_anomalies/o_veg_${year_start}_${year_end}_ia_anomalies.nc

cdo sub ${fol}/${exp_name}/monthly/o_efl_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_efl_${year_start}_${year_end}_climatology_allyears.nc ${fol}/${exp_name}/ia_anomalies/o_efl_${year_start}_${year_end}_ia_anomalies.nc

cdo sub ${fol}/${exp_name}/monthly/o_tmp_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_tmp_${year_start}_${year_end}_climatology_allyears.nc ${fol}/${exp_name}/ia_anomalies/o_tmp_${year_start}_${year_end}_ia_anomalies.nc

cdo sub ${fol}/${exp_name}/monthly/o_snow_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_snow_${year_start}_${year_end}_climatology_allyears.nc ${fol}/${exp_name}/ia_anomalies/o_snow_${year_start}_${year_end}_ia_anomalies.nc

cdo sub ${fol}/${exp_name}/monthly/o_soil_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_soil_${year_start}_${year_end}_climatology_allyears.nc ${fol}/${exp_name}/ia_anomalies/o_soil_${year_start}_${year_end}_ia_anomalies.nc

cdo sub ${fol}/${exp_name}/monthly/o_oth_${year_start}_${year_end}_monthly.nc ${fol}/${exp_name}/monthly_climatology/o_oth_${year_start}_${year_end}_climatology_allyears.nc ${fol}/${exp_name}/ia_anomalies/o_oth_${year_start}_${year_end}_ia_anomalies.nc


#standardized interannual anomalies
cdo div ${fol}/${exp_name}/ia_anomalies/o_wat_${year_start}_${year_end}_ia_anomalies.nc ${fol}/${exp_name}/monthly_climatology/o_wat_${year_start}_${year_end}_stdclimatology.nc ${fol}/${exp_name}/ia_anomalies/o_wat_${year_start}_${year_end}_stdia_anomalies.nc
cdo div ${fol}/${exp_name}/ia_anomalies/o_veg_${year_start}_${year_end}_ia_anomalies.nc ${fol}/${exp_name}/monthly_climatology/o_veg_${year_start}_${year_end}_stdclimatology.nc ${fol}/${exp_name}/ia_anomalies/o_veg_${year_start}_${year_end}_stdia_anomalies.nc
cdo div ${fol}/${exp_name}/ia_anomalies/o_soil_${year_start}_${year_end}_ia_anomalies.nc ${fol}/${exp_name}/monthly_climatology/o_soil_${year_start}_${year_end}_stdclimatology.nc ${fol}/${exp_name}/ia_anomalies/o_soil_${year_start}_${year_end}_stdia_anomalies.nc
cdo div ${fol}/${exp_name}/ia_anomalies/o_efl_${year_start}_${year_end}_ia_anomalies.nc ${fol}/${exp_name}/monthly_climatology/o_efl_${year_start}_${year_end}_stdclimatology.nc ${fol}/${exp_name}/ia_anomalies/o_efl_${year_start}_${year_end}_stdia_anomalies.nc
cdo div ${fol}/${exp_name}/ia_anomalies/o_snow_${year_start}_${year_end}_ia_anomalies.nc ${fol}/${exp_name}/monthly_climatology/o_snow_${year_start}_${year_end}_stdclimatology.nc ${fol}/${exp_name}/ia_anomalies/o_snow_${year_start}_${year_end}_stdia_anomalies.nc
cdo div ${fol}/${exp_name}/ia_anomalies/o_tmp_${year_start}_${year_end}_ia_anomalies.nc ${fol}/${exp_name}/monthly_climatology/o_tmp_${year_start}_${year_end}_stdclimatology.nc ${fol}/${exp_name}/ia_anomalies/o_tmp_${year_start}_${year_end}_stdia_anomalies.nc
cdo div ${fol}/${exp_name}/ia_anomalies/o_oth_${year_start}_${year_end}_ia_anomalies.nc ${fol}/${exp_name}/monthly_climatology/o_oth_${year_start}_${year_end}_stdclimatology.nc ${fol}/${exp_name}/ia_anomalies/o_oth_${year_start}_${year_end}_stdia_anomalies.nc



#interannual anomalies - std for o_soil
rm -rf ${fol}/${exp_name}/monthly_climatology/tmp/*
for year in "${array[@]}"
do
cdo -setyear,$year ${fol}/${exp_name}/monthly_climatology/o_soil_${year_start}_${year_end}_stdclimatology.nc ${fol}/${exp_name}/monthly_climatology/tmp/o_soil_${year}_year_stdclimatology.nc
done

cdo mergetime ${fol}/${exp_name}/monthly_climatology/tmp/o_soil_*_year_stdclimatology.nc ${fol}/${exp_name}/monthly_climatology/o_soil_${year_start}_${year_end}_stdclimatology_allyears.nc
cdo div ${fol}/${exp_name}/ia_anomalies/o_soil_${year_start}_${year_end}_ia_anomalies.nc ${fol}/${exp_name}/monthly_climatology/o_soil_${year_start}_${year_end}_stdclimatology_allyears.nc ${fol}/${exp_name}/ia_anomalies/o_soil_${year_start}_${year_end}_stdia_anomalies.nc



# FLUXMASK for o_efl:
# f_fol=~/work/fransje/DATA/FLUXCOM/RS/LE/T255/processed/
# f_mask=${f_fol}/${year_start}_${year_end}_fluxcom_mask.nc
# cdo -div ${fol}/${exp_name}/monthly/o_efl_${year_start}_${year_end}_monthly.nc $f_mask ${fol}/${exp_name}/monthly/o_efl_${year_start}_${year_end}_monthly_fluxmask.nc
# cdo -div ${fol}/${exp_name}/monthly_climatology/o_efl_${year_start}_${year_end}_climatology.nc $f_mask ${fol}/${exp_name}/monthly_climatology/o_efl_${year_start}_${year_end}_climatology_fluxmask.nc
# cdo -div ${fol}/${exp_name}/yearly/o_efl_${year_start}_${year_end}_yearly.nc $f_mask ${fol}/${exp_name}/yearly/o_efl_${year_start}_${year_end}_yearly_fluxmask.nc
# cdo -div ${fol}/${exp_name}/ia_anomalies/o_efl_${year_start}_${year_end}_ia_anomalies.nc $f_mask ${fol}/${exp_name}/ia_anomalies/o_efl_${year_start}_${year_end}_ia_anomalies_fluxmask.nc

done


