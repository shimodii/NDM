#!/bin/bash 

printf "[✓] hello, enter folder you want to save files: [like /home/amirmohammad/Downloads/] \n \n"
read dlpath

if [ -d $dlpath  ] 
then
		echo "[✓]Directory found."
		cd $dlpath
		printf "now enter URLs for download and part them with space [like -> URL1 URL2 ...]: \n \n"
		read URLS
	 	count=0 	
		touch temp.sh
		echo "#!/bin/bash" > temp.sh
		for i in $URLS 
		do
			((count++))
			echo "wget $i" >> temp.sh
		done
		chmod +x temp.sh
		bash temp.sh
		clear
		if [ $count -ge 1 ]
		then
				echo "$count files were download"
			else
				echo "$count file was download"
		fi
		rm temp.sh
	else
		echo "Error: dir does not exists."
fi 
