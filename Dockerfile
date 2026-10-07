FROM nginx:1.27
LABEL maintainer="Maciej Nalewczynski <maciej.nalewczynski@gmail.com>"

RUN apt-get update \
  && apt-get install -y --no-install-recommends curl \
  && rm -rf /var/lib/apt/lists/*

RUN rm -f /etc/nginx/conf.d/default.conf

COPY basic.conf /etc/nginx/conf.d/00-basic.conf
COPY nginx-default.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /opt/entrypoint.sh

RUN chmod a+x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
