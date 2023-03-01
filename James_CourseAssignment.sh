echo "Updating the package"
sudo apt update
echo "Checking appache status"

if  sudo systemctl status apache2; then
echo "Status  active"
 else 
echo "Installing"
sudo apt install apache2
sudo systemctl start apache2
sudo systemctl enable apache2
fi
echo "Tar file creating"
date_time=$(date '+%d%m%Y-%H%M%S')
myname='darshan'
s3_bucket='upgard-darshan09'

tar cvzf ${myname}-httpd-logs-${date_time}.tar 


aws s3  cp  ${myname}-httpd-logs-${date_time}.tar s3://4{s3_bucket}/${myname}-httpd-logs-${date_time}.tar
echo " Tar uploaded to s3 bucket" 

echo "httpd-logs ${date} tar ${size}>>index.html"

crontab -e 
00 10 * * * https://github.com/jamseyboy/james_course_assignment/blob/c330cf3cfaf7a399bcfaf2893c6f7f682bdc523c/James_CourseAssignment.sh
