#!/bin/bash

#limt=2000

i=1
size=100

#all=`cat download_all.list | wc -l`

all=2000

count=$(($all/$size))





f_head=1
f_tail=size

name='download_part'

mkdir -p build/list

if [ $(($all%$size)) -ne 0 ] ;then
	let count++
fi

echo "total: $all"
echo "size: $size"
echo "count: $count"


while [ $i -le $count ]
do
	f_tail=$(($size*$i))

	f_head=$(($f_tail-$size+1))  
	
	echo "[$f_head -- $f_tail] >>>>>> ${name}${i}.list"
	
	run="sed -n '${f_head},${f_tail}p'  download_all.list "
	
	echo ${run} | bash > build/list/${name}${i}.list

	let i++

done

