#!/bin/bash


##2023年 02月 06日

# 打印帮助信息
printHelp(){
	echo "mdpic-base64: Convert images in markdown to base64."
	echo "Usage: mdpic-base64 [InputFile] [outputFile]"
}


#echo "尚不可用"
#exit 255

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
# 找到图片存在的一行
args=`grep -E --text '\!\[.*\]\(.+\)' $input`

if [ $input != $output ]
then
	cp $input $output
fi



mkdir_flag=1


i=0
for arg in $args
do
	tmp=${arg%)*}
	url=${tmp#*(}
	echo Downloading file : $url

	if [[ $url =~ "png" ]]   # 包含子字符串png
	then
		if [[ $url =~ "http" ]]  # 包含子字符串http
		then
			if [ $mkdir_flag == 1 ]
			then
				mkdir_flag=0
				mkdir ".__md_pic_base64_${output}.files"   #创建临时文件夹存放图片
			fi

			imageFile=".__md_pic_base64_${output}.files/${i}.png"
			curl -o $imageFile  $url					# 下载网络图片

			# 获取base64编码
			base64Code="data:image/png;base64,`base64 -w 0 $imageFile`"

			# 替换文本
			sed -i "s#${url}#$base64Code#g" "$output"
			echo sed -i "s#${url}#data:image/png;base64...#g" "$output"
		else
			#获取base64编码
			base64Code="data:image/png;base64,`base64 -w 0 $url`"

			#替换文本
			sed -i "s#${url}#$base64Code#g" "$output"
			echo sed -i "s#${url}#data:image/png;base64...#g" "$output"
		fi
	elif [[ $url =~ "jpg" ]]   # 包含子字符串jpg
	then
		if [[ $url =~ "http" ]]  # 包含子字符串http
		then
			if [ $mkdir_flag == 1 ]
			then
				mkdir_flag=0
				mkdir ".__md_pic_base64_${output}.files"   #创建临时文件夹存放图片
			fi

			imageFile=".__md_pic_base64_${output}.files/${i}.jpg"
			curl -o $imageFile  $url					# 下载网络图片

			# 获取base64编码
			base64Code="data:image/jpg;base64,`base64 -w 0 $imageFile`"

			# 替换文本
			sed -i "s#${url}#$base64Code#g" "$output"
			echo sed -i "s#${url}#data:image/jpg;base64...#g" "$output"
		else
			#获取base64编码
			base64Code="data:image/jpg;base64,`base64 -w 0 $url`"

			#替换文本
			sed -i "s#${url}#$base64Code#g" "$output"
			echo sed -i "s#${url}#data:image/jpg;base64...#g" "$output"
		fi
	else
		echo error: $url
	fi
	let i++
done

# 删除临时创建的文件夹
if [ $mkdir_flag == 0 ]
then
	rm -rf "./.__md_pic_base64_${output}.files"
fi









