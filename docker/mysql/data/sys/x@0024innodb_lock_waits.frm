TYPE=VIEW
query=select `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,`rl`.`lock_table` AS `locked_table`,`rl`.`lock_index` AS `locked_index`,`rl`.`lock_type` AS `locked_type`,`r`.`trx_id` AS `waiting_trx_id`,`r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,`r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,`r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,`r`.`trx_mysql_thread_id` AS `waiting_pid`,`r`.`trx_query` AS `waiting_query`,`rl`.`lock_id` AS `waiting_lock_id`,`rl`.`lock_mode` AS `waiting_lock_mode`,`b`.`trx_id` AS `blocking_trx_id`,`b`.`trx_mysql_thread_id` AS `blocking_pid`,`b`.`trx_query` AS `blocking_query`,`bl`.`lock_id` AS `blocking_lock_id`,`bl`.`lock_mode` AS `blocking_lock_mode`,`b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,`b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,`b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat(\'KILL QUERY \',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat(\'KILL \',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection` from ((((`information_schema`.`innodb_lock_waits` `w` join `information_schema`.`innodb_trx` `b` on((`b`.`trx_id` = `w`.`blocking_trx_id`))) join `information_schema`.`innodb_trx` `r` on((`r`.`trx_id` = `w`.`requesting_trx_id`))) join `information_schema`.`innodb_locks` `bl` on((`bl`.`lock_id` = `w`.`blocking_lock_id`))) join `information_schema`.`innodb_locks` `rl` on((`rl`.`lock_id` = `w`.`requested_lock_id`))) order by `r`.`trx_wait_started`
md5=929bb457ad61f53c1bbf2329524fa499
updatable=0
algorithm=1
definer_user=mysql.sys
definer_host=localhost
suid=0
with_check_option=0
timestamp=2020-01-14 12:01:54
create-version=1
source=SELECT r.trx_wait_started AS wait_started, TIMEDIFF(NOW(), r.trx_wait_started) AS wait_age, TIMESTAMPDIFF(SECOND, r.trx_wait_started, NOW()) AS wait_age_secs, rl.lock_table AS locked_table, rl.lock_index AS locked_index, rl.lock_type AS locked_type, r.trx_id AS waiting_trx_id, r.trx_started as waiting_trx_started, TIMEDIFF(NOW(), r.trx_started) AS waiting_trx_age, r.trx_rows_locked AS waiting_trx_rows_locked, r.trx_rows_modified AS waiting_trx_rows_modified, r.trx_mysql_thread_id AS waiting_pid, r.trx_query AS waiting_query, rl.lock_id AS waiting_lock_id, rl.lock_mode AS waiting_lock_mode, b.trx_id AS blocking_trx_id, b.trx_mysql_thread_id AS blocking_pid, b.trx_query AS blocking_query, bl.lock_id AS blocking_lock_id, bl.lock_mode AS blocking_lock_mode, b.trx_started AS blocking_trx_started, TIMEDIFF(NOW(), b.trx_started) AS blocking_trx_age, b.trx_rows_locked AS blocking_trx_rows_locked, b.trx_rows_modified AS blocking_trx_rows_modified, CONCAT(\'KILL QUERY \', b.trx_mysql_thread_id) AS sql_kill_blocking_query, CONCAT(\'KILL \', b.trx_mysql_thread_id) AS sql_kill_blocking_connection FROM information_schema.innodb_lock_waits w INNER JOIN information_schema.innodb_trx b    ON b.trx_id = w.blocking_trx_id INNER JOIN information_schema.innodb_trx r    ON r.trx_id = w.requesting_trx_id INNER JOIN information_schema.innodb_locks bl ON bl.lock_id = w.blocking_lock_id INNER JOIN information_schema.innodb_locks rl ON rl.lock_id = w.requested_lock_id ORDER BY r.trx_wait_started
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,`rl`.`lock_table` AS `locked_table`,`rl`.`lock_index` AS `locked_index`,`rl`.`lock_type` AS `locked_type`,`r`.`trx_id` AS `waiting_trx_id`,`r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,`r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,`r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,`r`.`trx_mysql_thread_id` AS `waiting_pid`,`r`.`trx_query` AS `waiting_query`,`rl`.`lock_id` AS `waiting_lock_id`,`rl`.`lock_mode` AS `waiting_lock_mode`,`b`.`trx_id` AS `blocking_trx_id`,`b`.`trx_mysql_thread_id` AS `blocking_pid`,`b`.`trx_query` AS `blocking_query`,`bl`.`lock_id` AS `blocking_lock_id`,`bl`.`lock_mode` AS `blocking_lock_mode`,`b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,`b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,`b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat(\'KILL QUERY \',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat(\'KILL \',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection` from ((((`information_schema`.`innodb_lock_waits` `w` join `information_schema`.`innodb_trx` `b` on((`b`.`trx_id` = `w`.`blocking_trx_id`))) join `information_schema`.`innodb_trx` `r` on((`r`.`trx_id` = `w`.`requesting_trx_id`))) join `information_schema`.`innodb_locks` `bl` on((`bl`.`lock_id` = `w`.`blocking_lock_id`))) join `information_schema`.`innodb_locks` `rl` on((`rl`.`lock_id` = `w`.`requested_lock_id`))) order by `r`.`trx_wait_started`
