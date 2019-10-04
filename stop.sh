echo "Checking if the deployed version is same as of build folder"
mkdir -p /home/ec2-user/builds/log/

export deployedBuild=`basename /home/ec2-user/builds/lib/messageUtil-1.0.jar|cut -d '-' -f2|sed 's/.jar//'`
export deployVersion=`aws ssm get-parameter --name GATEWAY --region us-west-1 --query Parameter.Value|sed 's/"//g'`

echo application has been stop  >> /home/ec2-user/builds/log/application.log
echo deployVersion is equal to $deployVersion and deployedBuild is $deployedBuild  >> /home/ec2-user/builds/log/application.log

if [ $deployedBuild -eq $deployVersion ]
then
	echo "both builds are same, no need to stop the Application" >> /home/ec2-user/builds/log/application.log
else
	echo "New build is available, need to stop the Application, executiing stop.sh" >> /home/ec2-user/builds/log/application.log
fi
