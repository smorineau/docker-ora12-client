set termout off
set serveroutput on size unlimited
set pagesize 50000
set linesize 135
set long 50000
set trimspool on
set tab off
def _editor = "vi"

define gname=idle
column global_name new_value gname
select lower(user) || '@' ||
       substr(global_name,1,decode(dot,0,length(global_name),dot-1)) global_name
from (select global_name,instr(global_name,'.') dot from global_name);
set sqlprompt '&gname> '

set termout on