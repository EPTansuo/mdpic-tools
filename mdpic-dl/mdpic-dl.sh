#!/bin/bash



# 打印帮助信息
printHelp(){
	echo "mdpic-dl: Download network images in markdown."
	echo "Usage: mdpic-dl [InputFile] [outputFile]"
}


# 判断命令行参数的个数
if [ $# != 2 ]
then 
	echo "WRONG USAGE!"
	printHelp
	exit 255
fi

input="$1"
output="$2"

# 输入输出文件名相同时是否覆盖
if [ $input == $output ]
then
	echo "Warning: Input and output files have the same filename."
	read -p "Continue?[Y/n]" tmp
	if [[ $tmp != 'Y' && $tmp != 'y' ]]
	then
		exit 255
	fi
fi




#args=`grep  '.[*]*(*)' $input`
args=`grep -E --text '\!\[.*\]\(.+\)' $input`

if [ $input != $output ]
then
	cp $input $output
fi



mkdir "${output}.files"

i=0
for arg in $args
do
	tmp=${arg%)*}
	url=${tmp#*(}
	echo Downloading file : $url 
	png="`echo $url | grep -i .png`" 
	jpg="`echo $url | grep -i .jpg`" 
	if [  -n $png ]
	then 
		curl -o "${output}.files/${i}.png"  $url
		sed -i "s#${url}#./${output}.files/${i}.png#g" "$output"

		echo sed -i "s#${url}#./${output}.files/${i}.png#g" "$output"
	elif [ -n $jpg ] 
	then 
		curl -o "${output}.files/${i}.jpg"  $url
		sed -i "s#${url}#./${output}.files/${i}.jpg#g" "$output"
	else	
		cd "${output}.files"
		curl -O $url
		cd .. 
	fi
	let i++
done














