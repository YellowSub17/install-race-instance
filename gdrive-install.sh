



if [ $(whoami) != 'ec2-user' ]
then
    echo "Error: only users name 'ec2-user' can run this script"
    exit 1
fi

mkdir ~/gdrive

sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse

ID='163956980356-dsaksid9dc8hvtnlvuj4qjlc5n92ee39.apps.googleusercontent.com'
SECRET='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'

google-drive-ocamlfuse -headless -label me -id $ID -secret $SECRET
