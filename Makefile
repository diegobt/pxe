NAME=vagrant-pxe

.PHONY: all

all:
	@echo "make run -- run vagrant client and server"
	@echo "make clean -- stop and remove containers"

run: 
	@echo "+++ Starting server +++"
	cd server;vagrant up --provider virtualbox 
	@echo "+++ Starting client +++"
	cd client; vagrant up --provider virtualbox &

clean: 
	@echo "+++ Stopping and removing containers +++"
	VBoxManage list runningvms | awk '{print $$1}' | xargs -I{} VBoxManage controlvm {} poweroff 
	vagrant global-status | awk '/poweroff/{print $$1}' | xargs vagrant destroy -f 

list:
	vagrant global-status