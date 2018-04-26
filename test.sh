#!/bin/bash
#for skill in Ada Coffe Action Java; do
#echo "I am good at ${skill}Script"
#done

#myname='caoshiwei'
#myname='jacky cao'
#echo $myname

#只读变量
#myname='caoshiwei'
#readonly myname
#myname='jacky cao'

#变量区分大小写  等号两端不可以有空格
#myName='caoshiwei'
#echo $myName;
#echo $myname;

#将命令的结果赋值给变量 推荐使用第二种方式
#param=`date`
#echo $param
#param=$(date)
#echo $param

#特殊变量 $表示当前进程的id $0当前脚本的文件名称
#echo “this shell script is $0”
#echo "pid is $$"
#echo "params number is $#"
#echo "the first param is $1"
#echo "the second param is $2"
#echo "ok all params here $*"
#echo "have diffrence? $@"
#echo "$? is what!"

#$* 和$@ 的区别 当不使用双引号包裹时没区别，使用双引号包裹时$@会把各个参数分开 
#echo "\$*=" $*
#echo "\$@=" $@

#for var in "$*"
#do
#echo $var
#done

#for var in "$@"
#do 
#echo $var
#done

#for var in $*
#do
#echo $var
#done

#for var in $@
#do
#echo $var
#done


#unset删除变量
#myname='caoshiwei'
#unset myname;
#echo $myname;

#字符串 单引号里的变量不解释 单引号里不能出现单引号，转义也不可以
#param='hello'
#str='${param} you are so smart'
#echo $str;
#str='\'en en'
#echo str

#双引号里可以解释变量 双引号里可以添加转义字符
#param='~~~~'
#echo "i have a longlong 尾巴 ${param} \' is not it?"

#拼接字符串
#param='come on'
#str='baby'
#echo $param $str
#test="${param}${str}"
#echo $test

#获取字符串长度
#param='why not have no whitespace'
#echo ${#param}

#提取字符串 第一个参数是偏移量 从左至右 从零开始，第二个参数是长度
#param='oh my god'
#test=${param:6:3}
#echo $test

#数组 支持索引数组和关联数组
#arr=('c' 's' 'w')
#echo $arr
#echo "this array length is ${#arr[*]}"
#echo "this element length is ${#arr[2]}"
#echo ${arr[*]}
#arr2['i']='c'
#arr2['w']='s'
#echo ${arr2[*]}
#echo ${arr2[@]}

#显示命令的执行结果
#echo `date`

#printf的使用
#printf '%d %s \n' 1 'asd'

#if else 的用法 []和内容之间必须有空格 别忘记加then
#a=1
#b=2
#if [ $a == $b ]
#then
#echo $b - $a
#elif [ $a -gt $b ]
#then
#echo $a + $b
#else
#echo $b - $a
#fi
#if test $[2*3] -eq $[2+4];then echo 'the two number is equaled!';fi
#if test $[2*3] -eq $[2+4]
#then echo 'the two bumber is equal!'
#fi

#数值测试 -eq 相等则为证； -lt 小于则为真；-gt大于则为真；-ne不等则为真；-ge不小于；-le不大于
#a=1
#b=2
#c=2
#if test b -eq c
#then 
#echo $[b+c]
#fi
 
#关于转义字符 -e是转移操作生效 如果
#a=1o
#echo -e "a is ${a}\n haha"

#变量替换
#echo ${var:-"var is undefined"}
#echo ${var:="var is undefined and i define it"}
#echo $var
#echo ${var:?"var is undefined"}
#var=66
#echo ${var:+"var is defined"}

#转义字符

#echo -e "\\"
#echo -e "\b"
#echo -e "\f"
#echo -e "\n"
#echo -e "\r"
#echo -e "\t"
#echo -e "\v"


#运算符 原生bash不支持运算 需要借助awk 和 expr
#var=`expr 3 + 4`
#echo $var

#a=2
#b=3

#echo '$a + $b=' `expr $a + $b`
#echo '$a * $b=' `expr $a \* $b`
#echo '$a / $b=' `expr $a / $b`
#echo '$a % $b=' `expr $a % $b`

#布尔运算符
#a=1
#b=3
#if [ $a != $b ]
#then
#echo 'a is not equal to b'
#fi

#if [ $a -o $b ]
#then 
#echo 'a or b is true'
#fi

#if [ $a -a $b ]
#then 
#echo 'a and b is true'
#fi


#字符串运算符
#a=abc
#b=cdf

#if [ $a = $b ]
#then
#echo '$a is equal to $b'
#fi

#if [ $a != $b ]
#then
#echo '$a is not equal to $b'
#fi

#if [ -z $c ]
#then 
#echo -e '$c length is zero'
#fi

#if [ -n $a ]
#then
#echo -e '$a length is not zero'
#fi

#if [ $a ]
#then 
#echo '$a is a string'
#fi


#文件测试运算符
#dir="/home/caoshiwei"
#file="/home/caoshiwei/shell/test.sh"

#if [ -d $dir ]
#then
#echo '$dir is a dir'
#fi

#if [ -f $file ]
#then
#echo '$file is a file'
#fi

#case esac
#echo "please input a number"
#echo "your number is:\c"
#read num
#case $num in
#	1) echo 'you select 1'
#	;;
#	2) echo 'you select 2'
#	;;
#	3) echo 'you select 3'
#	;;
#	4) echo 'you select 4'
#	;;
#	*) echo 'your number is not between 1 to 4'
#	esac

#option=$1;

#case $option in
#	-f) file=$2
#	echo "filename is ${file}"
#	;;
#	-d) dir=$2
#	echo "dirname is ${dir}"
#	;;
#	*)echo "useage : [-f filename] | [-d dirname]"
#	esac


#for 循环
#for loop in 1 2 3 4
#do 
#echo $loop
#done

#for loop in /home/caoshiwei/*
#do
#echo $loop
#done

#while 循环

#COUNTER=0
#while [ $COUNTER -lt 5 ]
#do 
#COUNTER=`expr $COUNTER + 1`
#echo $COUNTER
#done

#while 循环监听键盘输入
#echo "type ctrl+D to terminate"
#echo -n 'enter your most like person name'
#while read person
#do
#echo "wa is ${person}"
#done

#until循环
#max=5
#until [ $max -lt 1 ]
#do
#echo "it is ${max}"
#max=`expr $max - 1`
#done

#break and continue
#
#while read person
#do
#  case $person in		
#	tongliya|pengyuyan)
#	 echo "yes I like him/her"
#	 continue
#	;;
# 	 *)
#	 echo "no I do not like,game is over"
 #        break
#	;;
#  esac
#done
 

#函数 函数返回值必须是证书，不设return将把最后一条命令运行结果作为返回值

#function hello(){
#echo hello world
#return 5
#}
#hello
#res=$?
#echo $res

function param(){
echo $@;
echo $*;
echo $1;
}
param 1 2 3 4






























