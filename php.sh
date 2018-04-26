#自动化编译安装php
DEFAULTVERSION='7.2.4'
SEPARATOR='+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
echo "|Tank you for use!!|"
echo "Please choose your php version:"
echo $SEPARATOR
read PHPVERSION
if [ -z $PHPVERSION ]
 then
  echo "if you do not choose we will use default [version ${DEFAULTVERSION}]"
  echo "please enter or input a version:"
  read PHPVERSION

  if [ -z $PHPVERSION ]
  then
  PHPVERSION=$DEFAULTVERSION
  fi

fi
echo $SEPARATOR
echo "begin download :${PHPVERSION}"
address="http://php.net/get/php-${PHPVERSION}.tar.gz/from/this/mirror"
zipname=$PHPVERSION
filename=php-$PHPVERSION.tar.gz
wget -O $filename $address
file $filename 
tar -zxvf $filename

echo "Please choose path:"
read BUILDPATH

while [ -z $BUILDPATH ]
do
echo "you must choose a path to instal your soft"
read BUILDPATH
done

echo $BUILDPATH
