yum repositoryのローカル保存

```
yum -y update
```

```
yum -y install createrepo repotrack
```

```
REPOSITORY_DIR="/home/local_repository"
REPOSITORY_NAME="local_repository"
```

```
mkdir -p $REPOSITORY_DIR
```

```
createrepo $REPOSITORY_DIR
```

yumコンフィグの追加
```
echo "[local_repository]
enabled=1
name=localrepo
gpgcheck=0
baseurl=file://${REPOSITORY_DIR}" > /etc/yum.repos.d/${REPOSITORY_NAME}.repo
```

```
yum clean all
```

```
yum repolist |grep ${REPOSITORY_NAME}
```

ローカル保存
```
function download_package(){
    package=$1
    yum install -y --downloadonly --downloaddir=$REPOSITORY_DIR $package
}
```

依存関係も含めたダウンロード
```
function dependency_download(){
    package=$1
    repotrack $REPOSITORY_DIR $package
}
```

インストール
```
yum -y --disablerep=/* --enablerepo=$REPOSITORY_NAME install
```

依存関係を気にせずインストール
```
yum localinstall --nogpgcheck  $REPOSITORY_DIR/*rpm
```
















