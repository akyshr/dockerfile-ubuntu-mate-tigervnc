Ubuntu MATE Desktop with tigervnc and xdm
=================================================

###Usage 
````bash
docker run -d -p 5900:5900 akyshr/ubuntu-mate-tigervnc
````

###Account
````
 USER : ubuntu
 PASSWD : ubuntu
````
###Change Language 

 docker run -d -p 5900:5900 -e "LANG=ja_JP.UTF-8" -e "TZ=JST-9" akyshr/ubuntu-mate-tigervnc
