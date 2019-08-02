bis_lib=$2
user=$1

useradd $user -d /data/${user}
mv $bis_lib /data/${user}/
chown -R $user /data/${user}/$bis_lib
chgrp -R $user /data/${user}/$bis_lib




#导入数据

cd sql
sh bis_inser.sh $user

su $user
unzip $bis_lib 

cd bis_lib
#启动jar包
sh java_start.sh



