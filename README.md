# Get Database through ssh

### Idea behind this
* This is a great tool to use when you are working locally against a site whose DB is ever changing. It is a quick an easy way to pull a database down to your local machine for development purposes

## How to use this template file: 

There are comments above each line describing what is needed on the line below. 
Some examples of things that are going to be required are:
 - remote database name
 - remote database user
 - local datatbase name

(these are jsut a few examples of required items that need to be filled out) 
 
Once all the variables are filled out there is just 1 more thing that needs to be added

Currently on this build you need to manually add the password to the ssh call. 
There were issue with the password working with the quotes, so it needs to be 
put into the call manually. 

To run this all you need to do is run: 

sh ~/path/to/file/ceros-getdb.sh

(feel free to rename the file, especially if you have multiple copies for 
different databases that you need access to)

***

## Shout out
Shout out to an old friend Will, He was the brains behind this .sh file. 