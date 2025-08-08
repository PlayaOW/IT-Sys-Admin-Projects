#!/bin/bash

echo "Welcome to user creation Script"
echo "Please provide a username: "
read username
usernames=$(cut -d ":" -f1 /etc/passwd > /tmp/userNames.txt)
for i in $usernames
do
	if [ "$i" = "$username" ]; then
		echo "Username not available"
		exit 1	

	fi
done

echo "Username available"
userFile="/tmp/$username"
mkdir $userFile
while true; do
	echo "Please enter a password"
	read -s passWord	
	echo "Please reneter your password"
	read -s reTypePass	

	if [ $passWord = $reTypePass ]; then
		echo "Password creation successful"
		break
	else
		echo "Passwords do not match, Try Again!"
	fi
done
hashed=$(openssl passwd -6 "$passWord")
echo "$hashed" > "/$userFile/password.txt"
chmod 600 "/$userFile/password.txt"

#echo "Please enter an user id (Must be over 1000!!)"

#read uID

userIDS=$(cut -d ":" -f3 /etc/passwd)


while true; do
	read -p "Enter an UID greater than 1000: " newID

	#Check if it is a number
	if ! [[ "$newID" =~ ^[0-9]+$ ]]; then
		echo "Invalid UID, Must be a number!!"
		continue
	fi

	#Checks if it is greater than 1000
	if [ "$newID" -le 1000 ]; then
		echo "UID must be greater than 1000! Try Again"
		continue
	fi

	#Checks if UID already exist in the list
	if echo "$userIDS" | grep -qw "$newID"; then
		echo "UID already exist"
		continue
	fi

	echo "UID is valid and available: $newID"
	break
done

echo $newID > /$userFile/UID.txt

groupID=$(cut -d ":" -f4 /etc/passwd)

while true; do
	read -p "Enter a group ID greater than 1000: " newGID

	#Chekc whether they are numbers
	if ! [[ "$newGID" =~ ^[0-9]+$ ]]; then
		echo "Invalid GID, Must be numbers!!"
		continue
	fi

	#Checks whether it is greater than 1000
	if [ "$newGID" -le 1000 ]; then
		echo "GID must be greater than 1000! Try Again"
		continue
	fi

	if echo "$groupID" | grep -qw "newGID"; then
		echo "GID already exist, try something else"
		continue
	fi

	echo "GID is valid and available"
	break
done


echo $newGID > /$userFile/GID.txt
