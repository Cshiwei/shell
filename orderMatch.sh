#!/usr/bin/env bash
#获取一定时间段内，已经配货完毕但是未发送库房的订单信息，如果订单数量超过阈值，则发送邮件给指定用户
DBUSERNAME='order_bj'
DBPASSWORD='pdpvYprwh69MN'
DBHOST='172.16.0.96'

mysql -h 172.16.0.96 -u order_bj -ppdpvYprwh69MN
#mysql -h $DBHOST -u $DBUSERNAME -p$DBPASSWORD