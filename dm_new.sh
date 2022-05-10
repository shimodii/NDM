#/bin/bash 

current_date=$(date | awk '{print $2"_"$3"_"$6"_"$4}')
download_dir="/tmp/$current_date"
download_list_dir="/tmp/$current_date/download_list"
download_path=""
echo $download_dir 

#if [[ $(cat )]]
