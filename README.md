### For what?
Automatically install and configure 3proxy on Ubuntu 20+ to use proxy.
Proxy's kinda vpn.
If you already have an installed ansible and you don't want to install docker just use a [simpler way to install 3proxy](https://github.com/GrinWay/ansible-install-3proxy).

### Configure app
Before installing the 3proxy, you have to have an installed [docker-desktop](https://www.docker.com/products/docker-desktop/) and obtained remote server.

Then in the root dir of this app open the terminal and execute:
```cmd
cp docker-compose.yaml.dist docker-compose.yaml
```

Open `docker-compose.yaml` and fill in all the rows with `# CONFIGURE` hint.

### Install 3proxy

In the root dir of this app open the terminal and execute:
```cmd
docker compose down && docker compose up --build
```

Wait to see:
```cmd
docker-install-3proxy exited with code 0
```

And it's done.
You can close the terminal and use your new proxy.
