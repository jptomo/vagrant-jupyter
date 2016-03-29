_sync_dir='/home/vagrant/sync'

if [ ! -d /home/vagrant/work ] ; then
	mkdir -p /home/vagrant/work
fi

yum clean all

if [ -z `rpm -qa | grep python-dnf` ] ; then
	yum localinstall -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
	yum install -y python-dnf
fi

dnf-2 clean all
dnf-2 update -y

if [ -z `rpm -qa | grep ansible` ] ; then
	dnf-2 --enablerepo=epel install -y ansible
fi

if [ -z `rpm -qa | grep '^man' | tr '\n' ' ' | tr ' ' '-'` ] ; then
	dnf-2 install -y man
fi
if [ -z `rpm -qa | grep '^man-pages' | tr '\n' ' ' | tr ' ' '-'` ] ; then
	dnf-2 install -y man-pages
fi

ansible-playbook "$_sync_dir/ansible/playbook_root.yml"
sudo -u vagrant ansible-playbook "$_sync_dir/ansible/playbook_user.yml"
ansible-playbook "$_sync_dir/ansible/playbook_server.yml"

dnf-2 clean all
