#!/bin/bash
fol=~/work/fransje/DATA/esacci_soilmoisture/processed

for th in 50 60 70 80
do
cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019-monthly-T255_${th}coverage.nc $fol/ESACCI-T255-${th}mask.nc
cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019-monthly-T127_${th}coverage.nc $fol/ESACCI-T127-${th}mask.nc
cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019-monthly-TL639_${th}coverage.nc $fol/ESACCI-TL639-${th}mask.nc

cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019_jja_${th}coverage.nc $fol/ESACCI-T255-jja-${th}mask.nc
cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019_djf_${th}coverage.nc $fol/ESACCI-T255-djf-${th}mask.nc
cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019_mam_${th}coverage.nc $fol/ESACCI-T255-mam-${th}mask.nc
cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019_son_${th}coverage.nc $fol/ESACCI-T255-son-${th}mask.nc

cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019_jja-T127_${th}coverage.nc $fol/ESACCI-T127-jja-${th}mask.nc
cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019_djf-T127_${th}coverage.nc $fol/ESACCI-T127-djf-${th}mask.nc
cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019_mam-T127_${th}coverage.nc $fol/ESACCI-T127-mam-${th}mask.nc
cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019_son-T127_${th}coverage.nc $fol/ESACCI-T127-son-${th}mask.nc

cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019_jja-TL639_${th}coverage.nc $fol/ESACCI-TL639-jja-${th}mask.nc
cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019_djf-TL639_${th}coverage.nc $fol/ESACCI-TL639-djf-${th}mask.nc
cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019_mam-TL639_${th}coverage.nc $fol/ESACCI-TL639-mam-${th}mask.nc
cdo -setrtoc,-3,3,1 $fol/ESACCI-SOILMOISTURE-1993-2019_son-TL639_${th}coverage.nc $fol/ESACCI-TL639-son-${th}mask.nc

cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019-ia_anomalies.nc $fol/ESACCI-T255-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019-ia_anomalies_${th}mask.nc
cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019-ia_anomalies-T127.nc $fol/ESACCI-T127-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019-ia_anomalies-T127_${th}mask.nc
cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019-ia_anomalies-TL639.nc $fol/ESACCI-TL639-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019-ia_anomalies-TL639_${th}mask.nc

cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019_djf_anomalies.nc $fol/ESACCI-T255-djf-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019_djf_anomalies_${th}mask.nc
cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019_jja_anomalies.nc $fol/ESACCI-T255-jja-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019_jja_anomalies_${th}mask.nc
cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019_mam_anomalies.nc $fol/ESACCI-T255-mam-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019_mam_anomalies_${th}mask.nc
cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019_son_anomalies.nc $fol/ESACCI-T255-son-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019_son_anomalies_${th}mask.nc

cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019_djf_anomalies-T127.nc $fol/ESACCI-T127-djf-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019_djf_anomalies-T127_${th}mask.nc
cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019_jja_anomalies-T127.nc $fol/ESACCI-T127-jja-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019_jja_anomalies-T127_${th}mask.nc
cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019_mam_anomalies-T127.nc $fol/ESACCI-T127-mam-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019_mam_anomalies-T127_${th}mask.nc
cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019_son_anomalies-T127.nc $fol/ESACCI-T127-son-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019_son_anomalies-T127_${th}mask.nc

cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019_djf_anomalies-TL639.nc $fol/ESACCI-TL639-djf-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019_djf_anomalies-TL639_${th}mask.nc
cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019_jja_anomalies-TL639.nc $fol/ESACCI-TL639-jja-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019_jja_anomalies-TL639_${th}mask.nc
cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019_mam_anomalies-TL639.nc $fol/ESACCI-TL639-mam-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019_mam_anomalies-TL639_${th}mask.nc
cdo -div $fol/ESACCI-SOILMOISTURE-1993-2019_son_anomalies-TL639.nc $fol/ESACCI-TL639-son-${th}mask.nc $fol/ESACCI-SOILMOISTURE-1993-2019_son_anomalies-TL639_${th}mask.nc

done
