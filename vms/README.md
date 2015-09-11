# Seting UP VM

## Using Docker

To install docker and docker compose follow this guide: https://docs.docker.com/compose/install/

To run the stack, inside the [vms](vms) directory use the following commands:

- `docker-compose build` to build the containers
- `docker-compose up -d` to start/restart the notebook server
- `docker-compose stop` to stop the notebook server

The python notebooks can be accessed from [http://localhost:8888](http://localhost:8888).
Note that to add your own notebooks, add them to the [notebooks](notebooks) directory of this repository.


## Using Vagrant

source: BerkeleyX EDX course CS100.1x
**Note that the vagrant image uses Spark 1.3**

### Installing Virtual Box:

- [windows](VIRTUALBOX FOR WINDOWS)
- [os x](https://youtu.be/3atHHNa2UwI)
- [linux](https://youtu.be/1_4USzcKx6g)

### Installing vagrant:

- [windows](https://youtu.be/phsPValZUOE)
- [os x](https://youtu.be/hPmawNk2XQw)
- [linux](https://youtu.be/f2cufy6wRfA)


### Starting VM:

- [windows](https://youtu.be/W_J7PESoujY)
- [os x](https://youtu.be/C5iV_g7sLjc)
- [linux](https://youtu.be/W4pv-3H2LNU)

### Important Commands:

- `vargant up` to start the VM
- `vagrant reload` to restart the VM
- `vagrant halt` to shutdown the VM
- `vagrant ssh` to ssh into the VM

Note that the location from which you run vagrant is accessible inside the VM as `/vagrant`

The python notebooks can be accessed from [http://localhost:8001](http://localhost:8001).
