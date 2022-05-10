#/bin/bash 

clear
current_date=$(date | awk '{print $2"_"$3"_"$6"_"$4}')
download_dir="/tmp/$current_date"
download_list_dir="/tmp/$current_date/download_list"
mkdir $download_dir
touch $download_list_dir

if [[ $(cat $download_list_dir) == $NULL ]]; then
	echo "There is no link to download"
else
	echo "links to download:"
	cat $download_list_dir
fi
echo
printf "Enter download path:"
read download_path

echo "[1] Start download
[2] Add link
[3] Change download path
[4] Clear download list
[5] Exit"
echo
printf "What is your choice (1-4): "
read choice
if [[ $choice == "1" ]]; then
	start_download
elif [[ $choice == "2" ]]; then
	add_link
elif [[ $choice == "3" ]]; then
	change_download_path
elif [[ $choice == "4" ]]; then
	clear_download_list
elif [[ $choice == "5" ]]; then
	exit 
else
	echo "Not sure about your choice!"
fi
