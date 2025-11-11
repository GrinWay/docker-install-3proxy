### For what?
Automatically install and configure 3proxy on Ubuntu 20+ to use proxy.
Proxy's kinda vpn.

### Configure app
Before installing the 3proxy, you have to have an installed docker and obtained remote server.

Then in the root dir of this app open the terminal and execute:
```cmd
cp docker-compose.yaml.dist docker-compose.yaml
```

Open `docker-compose.yaml` and fill in all the fields with `# CONFIGURE` hint.

### Install 3proxy

In the root dir of this app open the terminal and execute:
```cmd
docker compose down && docker compose up --build
```
