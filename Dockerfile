ARG NETBOX_IMAGE=docker.io/netboxcommunity/netbox:latest
FROM ${NETBOX_IMAGE}

COPY /src/plugin_requirements.txt /opt/netbox/plugin_requirements.txt
RUN /usr/local/bin/uv pip install --python /opt/netbox/venv/bin/python -r /opt/netbox/plugin_requirements.txt

COPY /src/plugins.py /etc/netbox/config/plugins.py
RUN SECRET_KEY="dummydummydummydummydummydummydummydummydummydummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
