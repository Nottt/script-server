# Script Server Docker

A docker create template for *nix systems (see [here for OS X and Windows)](https://github.com/Nottt/script-server/blob/master/README.md#os-x-and-windows):

```
docker create --rm \
           --name script-server \
           -p 5000:5000 \
           -v /etc/localtime:/etc/localtime:ro \
           -v /host/path/to/conf.json:/app/conf/conf.json \
           -v /host/path/to/runners/:/app/conf/runners \
           -v /host/path/to/scripts/:/app/scripts/ \
           -v /host/path/to/dependencies.sh:/etc/cont-init.d/99-deps \
           nottt/script-server
```

## Parameters

* `-v /host/path/to/scripts/` - Directory where you should put your scripts on host
* `-v /host/path/to/runners/` - This is a directory with all your script configurations (a config file per script)
* `-v /host/path/to/conf.json` - This should be your server configuration file
* `-v /host/path/to/dependencies.sh` - This should be a file written in Bash, that install whatever you scripts needs on Debian Buster
* `-v /etc/localtime:/etc/localtime:ro` - Sync time with host
* `-p *:*` - Ports used, only change the left ports.

**When editing `-v` and `-p` paremeters, the host is always the left and the docker the right. Only change the left**

For shell access while the container is running do `docker exec -it script-server bash`.

#### OS X and Windows

Windows and OS X platforms does not have `/etc/localtime` to retrieve timezone information, so you need to add a `-e TZ=Europe/Amsterdam` variable to your docker command and remove `-v /etc/localtime:/etc/localtime:ro \`. 

[List of Time Zones here](https://timezonedb.com/time-zones)
