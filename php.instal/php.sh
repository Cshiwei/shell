
#记录程序运行步骤
function getstep(){
cswstep='cswphp.step'
echo `cat $cswstep 2>/dev/null`
}


function setstep(){
cswstep='cswphp.step'
echo $1 > $cswstep
}

function getversion(){
cswversion='cswphp.version'
echo `cat $cswversion 2>/dev/null`
}

function setversion(){
cswversion='cswphp.version'
echo $1 > $cswversion
}

function echosuccess(){
echo "Tank you for using it!"
echo "If feeling is helpful to you, please praise more."
echo "I'm here: https://github.com/Cshiwei"
}

function echowelcome(){
echo "Tank you for Using it!"
echo "If you have any problems with your application, please ask questions on my blog."
echo "CSDN: https://blog.csdn.net/Csw_PHPer"
}


#显示usage信息
function echousage(){
 echo "usage :csw [option]"
 echo "info:"
 echo "Tank you for Using it!"
 echo "If you have any problems with your application, please ask questions on my blog."
 echo "CSDN: https://blog.csdn.net/Csw_PHPer"
 echo "[option]:"
 echo "--begin : A complete restart will ignore the previous operation"
 echo "--continue : The previous operations will continue to execute"
}

#环境依赖检测
function check_env(){
needcommand=(tar wget)
for loop in ${needcommand[*]}
do
		type $loop >/dev/null 2>&1
		if [ $? == 1 ]
		then
				echo "You need install ${loop} command before you begin!"
				return 1
		fi
done
return 0
}

#下载安装包
function down(){
while [ -z $phpversion ]
do
		echo "Please specify the PHP version:"
		read phpversion
done
zipname="php-${phpversion}.tar.gz"
address="http://php.net/get/${zipname}/from/this/mirror"
setversion $phpversion
wget -O $zipname $address
return $?
}

#解压安装包
function unpack(){
installversion=`getversion`
zipname="php-${installversion}.tar.gz"
tar -zxvf $zipname
return $?
}

#./configure 检测依赖生成makefile
function conf(){
while [ -z $buildpath ]
do
	 echo "Please specify installation path:"
	 read buildpath
done
if [ ! -d $buildpath ]
then
	mkdir -p $buildpath
fi
installversion=`getversion`
filename="php-${installversion}"
cd $filename
./configure --prefix=$buildpath
res=$?
cd ../
return $res
}

#获取安装目录
function getfilename(){
installversion=`getversion`
filename="php-${installversion}"
echo $filename
}


#make操作
function maker(){
filename=`getfilename`
cd $filename
echo "begin to make source ${separator}"
make
if [ $? -eq 0 ]
then
	make test
	if [ $? -eq 0 ]
	then
			make install
			if [ $? -eq 0 ]
			then
					cd ../
					return 0
			fi
	fi
fi
res = $?
cd ../
return $res
}


#make distclean
function maked(){
echo "You have compiled it once. Now we need to clear the contents of the last compilation..."
filename=`getfilename`
cd $filename
#res=`make distclean > /dev/null 2>&1`
make distclean
res=$?
cd ../
return $res
}

#success 操作 系统生成的临时文件
function success(){
rm -rf cswphp.version cswphp.step
return $?
}



















