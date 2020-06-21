*** Variables ***
#${ansible_password}  XXXXXXX
${USERNAME}   vdi-student
${PASSWORD}   Pa$$w0rd
${ansible_become_password}    ${PASSWORD}
${ansible_user}    ${USERNAME}
${DBHost}  localhost
${DBName}  w3schools
${DBUser}  XXXXXX
${DBPass}  XXXXXX
${DBPort}  3306
${DBFile}  w3schools.sql
${Furl}    https://raw.githubusercontent.com/AndrejPHP/w3schools-database/master/w3schools.sql
${gr}      /etc/apt/sources.list.d/google-chrome.list
${grep}    http://mirror.cs.uchicago.edu/google-chrome/pool/main/g/google-chrome-stable/
#${chrome_version}  False
${chrome_version}  google-chrome-stable_81.0.4044.138-1_amd64.deb
${chd81}  http://launchpadlibrarian.net/478575933/chromium-chromedriver_81.0.4044.138-0ubuntu0.18.04.1_amd64.deb


*** Settings ***
Library  Impansible
library  Collections
library  OperatingSystem
library  String
#Library  DatabaseLibrary

*** Keywords ***
Requirements
	No Operation
	#The Operating System should be Ubuntu
	#The Firefox browser should be installed if needed
	#The Geckodriver should be installed if needed
	#The google repo should be available
	#The Chrome should be installed if needed
	#The Chromedriver should be installed if needed
	#The MySQL server should be installed
	#Python should have MySQL support
	#The MySQL user have all privileges
	#Mysql should have no database imported
	#Mysql should have database imported

The Operating System should be Ubuntu
	${x}=	Setup  localhost
	${y}=	get from dictionary  ${x}   ansible_facts
	${z}=	get from dictionary  ${y}   ansible_distribution
	Should be Equal  ${z}  Ubuntu

The Firefox browser should be installed if needed
	[Timeout]    600
	${x}=  Convert To Lower Case  ${BROWSER}
	${x}=  Run Keyword and return status  Should Contain  ${x}  firefox
	Return from keyword if  not ${x}
	${x}=	apt    localhost   package=firefox   state=present
        ${x}=	get from dictionary  ${x}   invocation
        ${y}=	get from dictionary  ${x}   module_args
        ${s}=	get from dictionary  ${y}   state
        Should be Equal  ${s}  present
	${w}=	Run	which firefox
	Should Contain  ${w}  firefox

The Geckodriver should be installed if needed
	[Timeout]    600
	${x}=  Convert To Lower Case  ${BROWSER}
	${x}=  Run Keyword and return status  Should Contain  ${x}  firefox
	Return from keyword if  not ${x}
	${x}=	apt    localhost   package=firefox-geckodriver   state=present
        ${x}=	get from dictionary  ${x}   invocation
        ${y}=	get from dictionary  ${x}   module_args
        ${s}=	get from dictionary  ${y}   state
        Should be Equal  ${s}  present
	${w}=	Run	which geckodriver
	Should Contain  ${w}  geckodriver

The Chrome should be installed if needed
	[Timeout]    600
	${x}=  Convert To Lower Case  ${BROWSER}
	${x}=  Run Keyword and return status  Should Contain  ${x}  chrome
	       Return from keyword if  not ${x}
	${w}=	Run	which google-chrome-stable
	${x}=   run keyword and return status  Should Contain  ${w}  google-chrome-stable
	        Return from keyword if  ${x}
		run keyword if  "${chrome_version}"!="False"  apt  localhost  deb="${grep}${chrome_version}"
	${x}=	apt    localhost   package=google-chrome-stable   state=present
        ${x}=	get from dictionary  ${x}   invocation
        ${y}=	get from dictionary  ${x}   module_args
        ${s}=	get from dictionary  ${y}   state
        Should be Equal  ${s}  present
	${w}=	Run	which google-chrome-stable
	Should Contain  ${w}  google-chrome-stable

The Chromedriver should be installed if needed
	[Timeout]    600
	${x}=  Convert To Lower Case  ${BROWSER}
	${x}=  Run Keyword and return status  Should Contain  ${x}  chrome
	Return from keyword if  not ${x}
        ${x}=   package facts  localhost
        ${x}=   get from dictionary  ${x}   ansible_facts
        ${x}=   get from dictionary  ${x}   packages
        ${x}=   get from dictionary  ${x}   google-chrome-stable
        ${x}=   get from dictionary  ${x}[0]   version
        ${xs}=  run keyword and return status  should start with  ${x}  81
        ${x}=   run keyword if  not ${xs}  apt    localhost   package=chromium-chromedriver state=present
                run keyword if  ${xs}  apt  localhost  update_cache=yes
        ${x}=   run keyword if  ${xs}  apt  localhost  deb="${chd81}"  force=True
        #log to console   ${x}
	#${x}=	apt    localhost   package=chromium-chromedriver   state=present
        #${x}=	get from dictionary  ${x}   invocation
        #${y}=	get from dictionary  ${x}   module_args
        #${s}=	get from dictionary  ${y}   state
        #Should be Equal  ${s}  present
	${w}=	Run	which chromedriver
	Should Contain  ${w}  chromedriver

The MySQL server should be installed
	[Timeout]    600
	${x}=	apt    localhost   package=mysql-server   state=present
	${x}=	get from dictionary  ${x}   invocation
	${y}=	get from dictionary  ${x}   module_args
	${s}=	get from dictionary  ${y}   state
		Should be Equal  ${s}  present
	${w}=	Run	which mysqld
		Should Contain  ${w}  mysqld

Python should have MySQL support
	[Timeout]    600
	${x}=	apt    localhost   package=python-mysqldb   state=present
	${x}=	get from dictionary  ${x}   invocation
	${y}=	get from dictionary  ${x}   module_args
	${s}=	get from dictionary  ${y}   state
		Should be Equal  ${s}  present

The MySQL user have all privileges
	[Timeout]    600
	${x}=	apt    localhost   package=python-mysqldb   state=present
	${x}=	get from dictionary  ${x}   invocation
	${y}=	get from dictionary  ${x}   module_args
	${s}=	get from dictionary  ${y}   state
		Should be Equal  ${s}  present
		mysql_user  localhost  name=${DBUser}  password=${DBPass}  priv=*.*:ALL

Mysql should have no database imported
	[Timeout]    600
	mysql db  localhost  name=${DBName}  state=absent

Mysql should have database imported
	[Timeout]    600
	mysql db  localhost  name=${DBName}  state=present
	Get url   localhost  url=${Furl}     dest=/tmp/${DBFile}
	mysql db  localhost  name=${DBName}  state=import  target=/tmp/${DBFile}

Mysql requirements
	The MySQL server should be installed
	Python should have MySQL support
	Mysql should have no database imported
	Mysql should have database imported
	The MySQL user have all privileges

The google repo should be available
	[Timeout]    600
	${x}=	Stat  localhost  path="${gr}"
        ${x}=   get from dictionary  ${x}   stat
        ${x}=   get from dictionary  ${x}   exists
		run keyword if  not ${x}  Copy  localhost  content='deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main'  dest="${gr}"
		run keyword if  not ${x}  shell  localhost  wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
		run keyword if  not ${x}  apt  localhost  update_cache=yes
	${x}=	Stat  localhost  path="${gr}"
        ${x}=   get from dictionary  ${x}   stat
        ${x}=   get from dictionary  ${x}   exists
	Should be true  ${x}   "The google repo is not available"
