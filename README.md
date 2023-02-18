### Percona Cluster + Proxysql ###

3-nodes Percona Cluster + 1-node Proxysql

# Usage

Configure SQL users via :

- proxysql config file ( ./data/proxysql/etc/proxysql.cnf )

```
mysql_users =
(
    { username = "db01user01", password = "Password123", default_hostgroup = 10, transaction_persistent = 0, active = 1 },
)
```

- via proxysql-admin container CLI ( --syncusers )
```
bash-4.4$ proxysql-admin --syncusers

Syncing user accounts from PXC(db01:3306) to ProxySQL
Adding user to ProxySQL: clustercheck
Adding user to ProxySQL: db01user01
Adding user to ProxySQL: monitor
Adding user to ProxySQL: proxysql-monitor
Adding user to ProxySQL: root
Adding user to ProxySQL: xtrabackup
```

- via proxysql admin interface
```
mysql -u admin -padmin -h 127.0.0.1 -P6032 --prompt='proxysql> '   ( if local )
mysql -u radmin -pradmin -h 127.0.0.1 -P6032 --prompt='proxysql> ' ( if remote )

proxysql> INSERT INTO mysql_users(username,password,default_hostgroup) VALUES ('db01user01','Password123',10);
proxysql> LOAD MYSQL USERS TO RUNTIME
proxysql> SAVE MYSQL USERS TO DISK
```

Check mysql server status
```
proxysql> SELECT * FROM mysql_servers;

proxysql> SELECT * FROM monitor.mysql_server_ping_log ORDER BY time_start_us DESC LIMIT 6;

proxysql> SELECT * FROM monitor.mysql_server_connect_log ORDER BY time_start_us DESC LIMIT 6;

proxysql> select hostgroup_id, hostname, port, gtid_port, status, weight from runtime_mysql_servers;
```

Change galera hostgroup settings

```
proxysql> update mysql_galera_hostgroups set max_writers=2 where comment='cluster01';
proxysql> LOAD MYSQL SERVERS TO RUNTIME;
proxysql> SAVE MYSQL SERVERS TO DISK;
```


# Services

| Service   | Note |
| :---      | :--- |
| tcp://localhost:6032 | proxysql admin interface |
| https://localhost:6080 | proxysql web interface |
| http://localhost:8081 | adminer web interface |
| | |
| tcp://localhost:3306 | proxysql mysql |
| tcp://localhost:3307 | db01 mysql |
| tcp://localhost:3308 | db02 mysql |
| tcp://localhost:3309 | db03 mysql |

# Links

- https://severalnines109.rssing.com/chan-59082610/article64.html

- https://github.com/rongfengliang/proxysql-docker-compose/blob/master/proxysql.cnf


