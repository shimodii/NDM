#/bin/bash 

main_init () {
	clear
	if [[ $(cat $download_list_dir) == $NULL ]]; then
		echo "There is no link to download"
	else
		echo "links to download:"
		cat $download_list_dir
	fi
	echo
	echo "[1] Start download
	[2] Add link
	[3] Change download path
	[4] Clear download list
	[5] Exit"
	echo
	printf "What is your choice (1-4): "
	read choice
}
choice_read () {
	if [[ $choice == "1" ]]; then
		start_download
		main_init
	elif [[ $choice == "2" ]]; then
		add_link
		main_init
	elif [[ $choice == "3" ]]; then
		change_download_path
		main_init
	elif [[ $choice == "4" ]]; then
		clear_download_list
		main_init
	elif [[ $choice == "5" ]]; then
		exit 
	else
		echo "Not sure about your choice!"
		main_init
fi

}
start_download () {
	echo "Download is starting ..."
	for file in $(cat $download_list_dir)
	do
		printf "Would you download $file? [Y/N]\n"
		read answer
		if [[ $answer == "Y" ]]; then
			wget $file $download_path
		elif [[ $answer == "y" ]]; then
			wget $file $download_path
		elif [[ $answer == "n" ]]; then
			echo "Next URL..."
		elif [[ $answer == "N" ]]; then
			echo "Next URL..."
		fi	 
	done
	echo "Download finished, Thank for using ndm"
}
add_link () {
	clear
	printf "Enter link to download: "
	read link
	echo $link >> $download_list_dir
}
change_download_path () {
	clear
	printf "Enter new download path: "
	read download_path
}
clear_download_list () {
	rm $download_list_dir
	touch $download_list_dir
	main_init
}
clear
echo
echo
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
	main_init
elif [[ $choice == "3" ]]; then
	change_download_path
elif [[ $choice == "4" ]]; then
	clear_download_list
elif [[ $choice == "5" ]]; then
	exit 
else
	echo "Not sure about your choice!"
fi
