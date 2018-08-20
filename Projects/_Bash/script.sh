#! /bin/bash

# exercise 1:
# -------------
#echo "scripting is fun!"

# give rights to run script
# chmod 755 script.sh

# exercise 2:
# -----------
#STAT=$1
#echo "$STAT"

# exercise 3:
# ------------
# HOST=$(hostname)
# echo "This script is running on ${HOST}"

# exercise 4:
# ------------
# FILE=/etc/shadow
# if [ -f "$FILE" ]
# then
#   echo "Shadow passwords are enabled"
#   if [ -w "$FILE" ]
#   then
#     echo "You have permissions to edit /etc/shadow."
#   else
#     echo "You do NOT have permissions to edit /etc/shadow."
#   fi
# else
#   echo "File does not exist"
# fi

# exercise 5:
# ------------
# for ANIMAL in "man" "bear" "pig" "dog" "cat" "sheep"
# do
#   echo "$ANIMAL"
# done

# exercise 6: !not solved!
# ------------
# read -p "Enter file/directory name " $NAME
# if [ -d $NAME ]; then
#   echo "$NAME is a directory"
# elif [ -f $NAME ]; then
#   echo "$NAME is a regular file"
# else
#   echo "$NAME is another type of file"
# fi

# exercise 7:
# ------------
# $NAME=$1
# if [ -d $NAME ]; then
#   echo "$NAME is a directory"
# elif [ -f $NAME ]; then
#   echo "$NAME is a regular file"
# else
#   echo "$NAME is another type of file"
# fi

# exercise 8:
# ------------
# for NAME in @$
#   do
#   if [ -d $NAME ]; then
#     echo "$NAME is a directory"
#   elif [ -f $NAME ]; then
#     echo "$NAME is a regular file"
#   else
#     echo "$NAME is another type of file"
#   fi
#   done 
