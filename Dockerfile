FROM debian:bookworm-slim

# === 1. Аргументы, приходящие из docker-compose.yaml ===
ARG ANSIBLE_INVENTORY_HOSTS
ARG ANSIBLE_CONFIG
ARG VPN_LOGIN
ARG VPN_PASSWORD
ARG VPN_PORT

# === 2. Базовая настройка окружения ===
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    sshpass \
    python3-jmespath \
    ansible

WORKDIR /ansible/3proxy

# === 3. Копируем все роли, плейбуки, конфиги ===
COPY ./ansible .

# === 4. Генерация inventory из ARG ===
RUN cat <<DATA_EOF > ./inventory/hosts.yml
${ANSIBLE_INVENTORY_HOSTS}
DATA_EOF

RUN cat <<DATA_EOF > ./ansible.cfg
${ANSIBLE_CONFIG}
DATA_EOF

# === 5. (опционально) сохраняем VPN-параметры в vars-файл ===
RUN cat <<DATA_EOF > ./configure-3proxy/defaults/main.yml
vpn_login: '${VPN_LOGIN}'
vpn_password: '${VPN_PASSWORD}'
vpn_port: '${VPN_PORT}'
DATA_EOF

# === 7. Проверим, что Ansible видит хосты ===
RUN ansible-inventory --list --yaml

# === 8. Команда по умолчанию (можно изменить в docker-compose) ===
CMD ["ansible-playbook", "playbook/3proxy.yml"]
