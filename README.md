### Percona Cluster + Proxysql ###

2-nodes Percona Cluster + 1-node Proxysql

# Usage

Configure SQL users via :

- proxysql config file ( ./data/proxysql/etc/proxysql.cnf )

```
mysql_users =
(
    { username = "db01user01", password = "Password123", default_hostgroup = 10, transaction_persistent = 0, active = 1 },
)
```

- via proxysql-admin CLI ( --syncusers )
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


# Services

| Service   | Note |
| :---      | :--- |
| tcp://localhost:6032 | proxysql admin interface |
| https://localhost:6080 | proxysql web interface |
| :---      | :--- |
| tcp://localhost:3306 | proxysql mysql |
| tcp://localhost:3307 | db01 mysql |
| tcp://localhost:3308 | db02 mysql |

# Links

- https://severalnines109.rssing.com/chan-59082610/article64.html

- https://github.com/rongfengliang/proxysql-docker-compose/blob/master/proxysql.cnf


