#!/bin/bash

bash ./clear.sh

bash ./compile.sh

count=`ls build/list/*part* | wc -l`

mkdir -p build/src
mkdir -p build/package

i=1

cd build/src

while [ $i -le $count ]
do
	echo "mkdir -p download_part$i" | bash

        echo "cd download_part$i && wget -i ../list/download_part${i}.list && cd .."
	
	echo "tar zcmpf ../package/download_part${i}.tar.gz download_part$i/" | bash

	let i++
done

