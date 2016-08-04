# Oracle database 12 client container #

## Usage ##

Here is the generic command to use the container and enable access to the current directory's contents :

`docker run -it -v $(pwd):/sql-src --rm `*`IMAGE COMMAND `*`[--dbid `*`"DB_CONNECT_STRING"`*`]`

The `COMMAND` option accepts the following values
* `sql+`
* `watch`
* `setup`
* `cleanup`

The `sql+` command runs a sql\*plus client (with command history using the arrow keys):

`docker run -it -v $(pwd):/sql-src --rm `*`IMAGE`*` sql+`

The `watch` commands facilitates pl/SQL TDD:

`docker run -it -v $(pwd):/sql-src --rm `*`IMAGE`*` watch`

## Build ##

Before building the image, first download the required software files : 

[Oracle 12.1.0.2.0 - Instant Client Package - Basic Lite](http://download.oracle.com/otn/linux/instantclient/121020/instantclient-basiclite-linux.x64-12.1.0.2.0.zip)

[Oracle 12.1.0.2.0 - Instant Client Package - SQL*Plus](http://download.oracle.com/otn/linux/instantclient/121020/instantclient-sqlplus-linux.x64-12.1.0.2.0.zip)

To build an image named `oracli:12` run the command :
`docker build -t oracli:12 .`

If you use frequently the same database you can specify a default connection string. This can be done by editing the file startup.sh and modify the value of the variable DEFAULT_DB_CONNECT_STRING. This value can be overriden at runtime using the `--dbid` option as described in the usage section.