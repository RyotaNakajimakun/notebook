yum repositoryのローカル保存

yum -y install createrepo

REPOSITORY_DIR="/home/local_repository/"
mkdir -p $REPOSITORY_DIR

createrepo $REPOSITORY_DIR

echo "
[local]                      #リポジトリID
name=local repository        #リポジトリの説明
baseurl=file://${REPOSITORY_DIR}    #リポジトリのパス
gpgcheck=0                   #GPG署名確認を無効
enabled=0                    #デフォルトではリポジトリを無効
" > /etc/yum.repos.d/local.repo

yum clean all

yum repolist |grep local


ローカル保存
function download_package(){
    package=$1
    yum install -y --downloadonly --downloaddir=$REPOSITORY_DIR $package
}
