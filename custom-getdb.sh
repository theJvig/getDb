#!/bin/bash

####################### - - REMOTE USER - - #######################
#username for the ceros server
remoteuser=
#server address for the ceros server
remoteip=
#remote server db name
remoteDBname=
#remoteDB user name
remoteDBuser=
#remoteDB user password (for now this needs to be written right into the statement, until how to handle quotes is figured out)
remoteDBpass=
####################### - - END REMOTE USER - - #######################

####################### - - LOCAL USER - - #######################
#absolute path to local machine (need to replace username)
localdestination=/Users/username/
#username of local DB 
localdbusername=
#password of local DB 
localdbpass=
#name of your local database (this will need to be created, you can name it whatever you wish)
localdbname=
#path to mysql on your local machine 
localmysqlpath=
####################### - - END LOCAL USER - - #######################

#filename and file path of the database export
filename=${localdbname}.sql.gz
filepath=/home/${remoteuser}/${filename}

#ssh into the server and export a sql file of ht edatebase to the above path (Need to add the password in this line too in the quotes after where it is -p)
ssh ${remoteuser}@${remoteip} "mysqldump -u ${remoteDBuser} -p'' ${remoteDBname} | gzip > ${filepath}"

#copy the newly created file to the defined local db
scp  ${remoteuser}@${remoteip}:${filepath} ${localdestination}

#remote the old sql file from the last pull if it exists to avoid having to confirm deletion
rm -f ${localdestination}/${filename}.sql || true

#unzip the .gz file and keep the copy of the .sql.gz file
gunzip -k ${localdestination}/${filename}

#upload file to local mysql DB
${localmysqlpath}mysql --host=localhost -u${localdbusername} -p${localdbpass} ${localdbname} < ${localdestination}/${localdbname}.sql
