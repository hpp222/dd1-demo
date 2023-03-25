
source code from https://o7planning.org/10683/create-a-shopping-cart-web-application-with-spring-boot-hibernate

# Two-tier Architecture Configuration
## Create Aurora Databases
From https://docs.aws.amazon.com/dms/latest/sql-server-to-aurora-mysql-migration-playbook/chap-sql-server-aurora-mysql.sql.casesensitivity.html: In Aurora MySQL version 3, the value of the ```lower_case_table_names``` parameter is set permanently at the time when you create the cluster. 

1. Before create db, create a cluster parameter group, select ```aurora-mysql8.0``` in Parameter group family. After creation, set ```lower_case_table_names``` to ```1```, meaning names stored in lowercase and comparisons aren’t case-sensitive.
2. create Aurora db

    | options | selection |
    | --- | --- |
    | Choose a database creation method | Standard create |
    |Engine options | Aurora MySQL 3.03.0 (compatible with MySQL 8.0.26)|
    | Templates | Dev/Test |
    | initial database name | sample |
    | DB cluster parameter group | custom para group |

## Create a bastion host

Install mysql in the bastion host and connect to the db:

```
sudo yum install mysql
```
```
mysql -h Endpoint -P3306 -u xxx -pxxx
```

Then run schema.sql and data.sql in sample database.


## Prerequisites on Amazon Linux EC2 (Hosting SpringBoot Webserver)

Create another EC2, then download required dependencies for webserver:

https://docs.aws.amazon.com/neptune/latest/userguide/iam-auth-connect-prerq.html

```
sudo wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
```

```
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
```

```
sudo yum install -y apache-maven
```

```
sudo yum install java-1.8.0-devel

java -v
```

## Launch Webserver

```git
git clone https://github.com/hpp222/dd1-demo.git
```

in dd1-demo dir:
```
mvn clean package -Dmaven.test.skip=true
cd target
```

```
java -jar ShoppingCart-0.0.1-SNAPSHOT.jar --server.port=8080 --spring.datasource.username=xxx --spring.datasource.password=xxx --spring.datasource.url=jdbc:mysql://dbendpoint:3306/sample?useSSL=false
```

In browser, access ```http://Public IPv4 address of EC2:8080```
