NAME=vagrant-pxe

.PHONY: all

all:
	@echo "make run -- run vagrant client and server"
	@echo "make clean -- stop and remove containers"

run: 
	make run-server
	make run-client

clean:
	cd server; vagrant destroy -f
	cd client; vagrant destroy -f

kill:
	VBoxManage list runningvms | awk '{print $$1}' | xargs -I{} VBoxManage controlvm {} poweroff 

list:
	vagrant global-status

run-test:
	@echo "+++ Starting test client +++"
	if [[ `vagrant global-status` =~ .*pxe_client* ]] ; \
	then \
	   cd client; vagrant halt; \
	fi;
	if [[ -a client/Vagrantfile.test ]] ; \
	then \
		cd client; \
		mv Vagrantfile Vagrantfile.pxe; \
		mv Vagrantfile.test Vagrantfile; \
	fi;
	cd client; vagrant up --provider virtualbox &

run-client:
	@echo "+++ Starting pxe client +++"
	if [[ `vagrant global-status` =~ .*pxe_client* ]] ; \
	then \
	   cd client; vagrant halt; \
	fi;
	if [ -a client/Vagrantfile.pxe ]; then \
		cd client; \
		mv Vagrantfile Vagrantfile.test; \
		mv Vagrantfile.pxe Vagrantfile; \
		fi;
	cd client; vagrant up --provider virtualbox &

run-server:
	@echo "+++ Starting pxe server +++"
	if [[ `vagrant global-status` =~ .*pxe_server* ]] ; \
	then \
	   cd server; vagrant destroy -f; \
	fi;
	cd server;vagrant up --provider virtualbox 


