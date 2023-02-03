#!/bin/bash

fol=~/work/fransje/htessel_output

for exp_name in exp6 exp3 ex10 #ex11 #exp1 exp2 exp3 exp4 exp5 exp6 exp7 exp8 exp9
do

mkdir -p $fol/$exp_name/monthly
mkdir -p $fol/$exp_name/monthly/tmp
mkdir -p $fol/$exp_name/monthly_climatology
mkdir -p $fol/$exp_name/yearly
mkdir -p $fol/$exp_name/ia_anomalies
mkdir -p $fol/$exp_name/monthly_climatology/tmp
mkdir -p $fol/$exp_name/seasonal
rm -rf ${fol}/${exp_name}/monthly/tmp/*.nc

# monthly mean
for year in {1980..2019}
do
cdo -setday,15 -settime,00:00:00 -monmean ${fol}/${exp_name}/${year}/o_wat_${year}.nc ${fol}/${exp_name}/monthly/tmp/o_wat_${year}_monthly.nc
cdo -setday,15 -settime,00:00:00 -monmean ${fol}/${exp_name}/${year}/o_veg_${year}.nc ${fol}/${exp_name}/monthly/tmp/o_veg_${year}_monthly.nc
cdo -setday,15 -settime,00:00:00 -monmean ${fol}/${exp_name}/${year}/o_tmp_${year}.nc ${fol}/${exp_name}/monthly/tmp/o_tmp_${year}_monthly.nc
cdo -setday,15 -settime,00:00:00 -monmean ${fol}/${exp_name}/${year}/o_efl_${year}.nc ${fol}/${exp_name}/monthly/tmp/o_efl_${year}_monthly.nc
cdo -setday,15 -settime,00:00:00 -monmean ${fol}/${exp_name}/${year}/o_oth_${year}.nc ${fol}/${exp_name}/monthly/tmp/o_oth_${year}_monthly.nc
cdo -setday,15 -settime,00:00:00 -monmean ${fol}/${exp_name}/${year}/o_snow_${year}.nc ${fol}/${exp_name}/monthly/tmp/o_snow_${year}_monthly.nc
cdo -setday,15 -settime,00:00:00 -monmean ${fol}/${exp_name}/${year}/o_soil_${year}.nc ${fol}/${exp_name}/monthly/tmp/o_soil_${year}_monthly_t.nc

# get also avg SM2,3,4 in o_soil
cdo expr,'SWVL234=SWVL2+SWVL3+SWVL4' ${fol}/${exp_name}/monthly/tmp/o_soil_${year}_monthly_t.nc ${fol}/${exp_name}/monthly/tmp/o_soil_${year}_monthly_sum.nc
cdo divc,3 ${fol}/${exp_name}/monthly/tmp/o_soil_${year}_monthly_sum.nc ${fol}/${exp_name}/monthly/tmp/o_soil_${year}_monthly_avg.nc
cdo merge ${fol}/${exp_name}/monthly/tmp/o_soil_${year}_monthly_t.nc ${fol}/${exp_name}/monthly/tmp/o_soil_${year}_monthly_avg.nc ${fol}/${exp_name}/monthly/tmp/o_soil_${year}_monthly.nc
done

rm -rf ${fol}/${exp_name}/monthly/tmp/*avg*
rm -rf ${fol}/${exp_name}/monthly/tmp/*sum* 
rm -rf ${fol}/${exp_name}/monthly/tmp/*_t.nc 

# merge monthly mean for all years
cdo mergetime ${fol}/${exp_name}/monthly/tmp/o_wat_*.nc ${fol}/${exp_name}/monthly/o_wat_1980_2019_monthly.nc
cdo mergetime ${fol}/${exp_name}/monthly/tmp/o_veg_*.nc ${fol}/${exp_name}/monthly/o_veg_1980_2019_monthly.nc
cdo mergetime ${fol}/${exp_name}/monthly/tmp/o_tmp_*.nc ${fol}/${exp_name}/monthly/o_tmp_1980_2019_monthly.nc
cdo mergetime ${fol}/${exp_name}/monthly/tmp/o_efl_*.nc ${fol}/${exp_name}/monthly/o_efl_1980_2019_monthly.nc
cdo mergetime ${fol}/${exp_name}/monthly/tmp/o_oth_*.nc ${fol}/${exp_name}/monthly/o_oth_1980_2019_monthly.nc
cdo mergetime ${fol}/${exp_name}/monthly/tmp/o_snow_*.nc ${fol}/${exp_name}/monthly/o_snow_1980_2019_monthly.nc
cdo mergetime ${fol}/${exp_name}/monthly/tmp/o_soil_*.nc ${fol}/${exp_name}/monthly/o_soil_1980_2019_monthly.nc

done


