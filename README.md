# Oracle database 12 client container #

## Usage ##

The container may be used as a simple sql\*plus client:  
`docker run -it --rm `*`IMAGE`*` bash `

It can also be used to facilitate pl/SQL TDD:  
`docker run -it -v $(pwd):/sql-src --rm `*`IMAGE`*` watch `*`DB_CONNECT_STRING`* 

## Pre-requisites ##

Before building the image, first download the required software files : 

[Oracle 12.1.0.2.0 - Instant Client Package - Basic Lite](http://download.oracle.com/otn/linux/instantclient/121020/instantclient-basiclite-linux.x64-12.1.0.2.0.zip)

[Oracle 12.1.0.2.0 - Instant Client Package - SQL*Plus](http://download.oracle.com/otn/linux/instantclient/121020/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip)

