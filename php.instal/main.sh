#自动化编译安装php
source ./php.sh
STEP=`getstep`

isbegin='false'
if [ $# -gt 1 ]
then
		case $2 in 
				'--begin') 
						setstep 'check_env'
						isbegin='true'
						;;
				'--continue')
						isbegin='true'
						;;
				*)
						;;
		esac
fi

if [ $isbegin = 'false' ]
then
		echousage
		exit 1
fi

STEP=`getstep`

if [ -z $STEP ]
then
	STEP='check_env'
fi

#依赖检测
if [ $STEP = 'check_env' ]
then
		check_env
		if [ $? -ne 0 ]
		then
				exit 2
		fi
STEP='down'
setstep 'down'
fi

#下载安装包
if [ $STEP = 'down' ]
then
		down 
		if [ $? -ne 0 ]
		then
				exit 3
		fi
STEP='unpack'
setstep 'unpack'
fi


#解压安装包
if [ $STEP = 'unpack' ]
then
		unpack
		if [ $? -ne 0 ]
		then
				exit 4
		fi
STEP='conf'
setstep 'conf'
fi

#./configure 检测环境，并生成makefile
if [ $STEP = 'conf' ]
then
		conf
		if [ $? -ne 0 ]
		then
				exit 5
		fi
STEP='maker'
setstep 'maker'
fi

#make 操作
if [ $STEP = 'maker' ]
then
		maker
		if [ $? -ne 0 ]
		then
				setstep 'maked'
				exit 6
		fi

STEP='success'
setstep 'success'
fi

#如果已经编译过将删除掉之前编译的内容
if [ $STEP = 'maked' ]
then
		maked
		if [ $? -eq 0 ]
		then
				setstep 'conf'
				echo "Please reboot the program using the [--contniue] method"
				exit 7
		else
				echo "Delete failure, please confirm that the permissions are sufficient"
				exit 8
		fi
fi

#删除临时文件
if [ $STEP = 'success' ]
then
		success
		if [ $? -ne 0 ]
		then
				exit 7
		else
				echosuccess
		fi	
fi






















