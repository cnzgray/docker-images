## 启动MySQL

```bash
docker run --name mysql56 -d --restart always \
    -v mysql56_data:/var/lib/mysql \
    -v mysql56_conf:/etc/mysql/conf.d \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=root \
    mysql:5.6
```

## XtraBackup备份

```bash
docker run --rm -it \
    -v mysql56_data:/var/lib/mysql \
    -v $PWD:/xtrabackup_backupfiles \
    perconalab/percona-xtrabackup --backup --host=<IP> --port=3306 --user=root --password=root
```


## XtraBackup还原

> 注意需要先清空mysql的数据目录，并记住目录权限和所有者。

```bash
docker rm -f mysql56
docker volume rm mysql56_data
```

```bash
docker run --rm -it \
    -v mysql56_data:/var/lib/mysql \
    -v $PWD:/xtrabackup_backupfiles \
    perconalab/percona-xtrabackup --copy-back --target-dir=/xtrabackup_backupfiles
```