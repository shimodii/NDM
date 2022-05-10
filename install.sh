#!/bin/bash

sudo cp ./NDM.sh /usr/local/bin/ndm 
sudo cp ./NDM.sh /usr/local/bin/NDM

if [[ $? == "0" ]]; then
	echo "Done !"
else
	echo "Some ERROR happend"
fi
