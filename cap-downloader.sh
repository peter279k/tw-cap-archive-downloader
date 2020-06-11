#!/bin/bash

echo 'Check required command....'

which wget 2>&1 > /dev/null

if [[ $? != 0 ]]; then
    echo "Please install wget package..."

    exit 1;
fi;

today_date=$(date -d "-1 Day" "+%Y/%m/%d")
today_date_for_archive=$(date -d "-1 Day" "+%Y_%m_%d")

zip_archive_file_url="http://61.56.4.170/CapZipAuto/Cap_2020_05_13and${today_date_for_archive}.zip"

rm -f ${PWD}"/AlertdataDownload.aspx"

wget -q --no-check-certificate https://alerts.ncdr.nat.gov.tw/AlertdataDownload.aspx

cat AlertdataDownload.aspx | grep ${today_date} 2>&1 > /dev/null

if [[ $? != 0 ]]; then
    echo "Do nothing"
    rm -f ${PWD}"/AlertdataDownload.aspx"

    exit 0;
fi;

if [[ ! -d ${PWD}/archives ]]; then
    mkdir ./archives/
fi;

cd ${PWD}"/archives/"

if [[ -f ${PWD}"/Cap_2020_05_13and${today_date_for_archive}.zip" ]]; then
    echo ${PWD}"/Cap_2020_05_13and${today_date_for_archive}.zip file is existed..."
    cd ../
    rm -f ${PWD}"/AlertdataDownload.aspx"

    exit 0;
fi;

wget -q --no-check-certificate ${zip_archive_file_url} 2>&1 > /dev/null

echo "Download ${zip_archive_file_url} has been done..."

cd ../
rm -f ${PWD}"/AlertdataDownload.aspx"
