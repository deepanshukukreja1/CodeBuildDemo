echo "Checking if the deployed version is same as of build folder"

deployedBuild=`echo /home/ec2-user/builds/lib/messageUtil-1.0.jar|cut -d '-' -f2|sed 's/.jar//'`
deployVersion=`aws ssm get-parameter --name GATEWAY --region us-west-1 --query Parameter.Value|sed 's/"//g'`

echo application has been stop
echo deployVersion is equal to $deployVersion and deployedBuild is $deployedBuild
