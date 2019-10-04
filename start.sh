mkdir -p /home/ec2-user/builds/log/
if [ -f  /home/ec2-user/builds/lib/messageUtil-1.0.jar ]
then
	deployedBuild=`basename /home/ec2-user/builds/lib/messageUtil*.jar|cut -d '-' -f2|sed 's/.jar//'`
	deployVersion=`aws ssm get-parameter --name GATEWAY --region us-west-1 --query Parameter.Value|sed 's/"//g'`
fi
deployVersion=`aws ssm get-parameter --name GATEWAY --region us-west-1 --query Parameter.Value|sed 's/"//g'` >> /home/ec2-user/builds/log/application.log

echo application has been stop  >> /home/ec2-user/builds/log/application.log
echo deployVersion is equal to $deployVersion and deployedBuild is $deployedBuild  >> /home/ec2-user/builds/log/application.log

sh /home/ec2-user/builds/GATEWAY/bin/startup.sh >/dev/null 2>&1 &  >> /home/ec2-user/builds/log/application.log
echo "Application has been started"  >> /home/ec2-user/builds/log/application.log
echo "\n"
