# Vagrant PXE test environment

This is a vagrant PXE client/server environment that supports virtualbox and libvirt providers.  
dhcp/tftp config files are in the config/ directory. The distro to boot from is in the resources/ directory. Both paths are set from setup.sh.  
Vagrant files for client and server are included in respective directories.  


## Setup
- Check config/* for PXE configuration
- Put your PX boot distro in resources/
- Change setup.sh to include your resources/distro


## Run PXE server

### Virtualbox provider
Requires [virtualbox extension pack](https://www.virtualbox.org/wiki/Downloads).

```
$ cd vagrant-pxe/server
$ vagrant up --provider virtualbox
$ vagrant ssh
```

### Libvirt provider
Requires [Vagrant-libvirt Provider](https://github.com/vagrant-libvirt/vagrant-libvirt)

```
$ cd vagrant-pxe/server
$ vagrant up --provider libvirt
$ vagrant ssh
```


## Run PXE client

### Virtualbox provider
```
$ cd vagrant-pxe/client
$ vagrant up --provider virtualbox
```
Virtualbox gui will pop up, showing vm netboot.


### Libvirt provider
```
$ cd vagrant-pxe/client
$ vagrant up --provider libvirt
```
Qemu/kvm gui will pop up, showing vm netboot.


To restart boot procedure.
```
$ vagrant reload
```

## Known issues

Vagrant will hang on ``Waiting for domain to get an IP address...``.  
That's because box ask for network configuration on management network which do not exist here. Please ignore it.  


##  References

http://www.jedi.be/blog/2011/11/04/vagrant-virtualbox-hostonly-pxe-vlans/
https://github.com/eoli3n/vagrant-pxe


