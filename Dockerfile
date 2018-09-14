FROM ubuntu:14.04
LABEL maintainer saboyutaka "saboyutaka<yutaka.paradigm.shift@gmail.com>"

RUN apt-get -y update && apt-get -y install \
    sudo \
    openssh-server \
    git \
    curl \
    rake \
    ruby2.0 ruby2.0-dev \
    bison \
    libcurl4-openssl-dev \
    libhiredis-dev \
    libmarkdown2-dev \
    libcap-dev \
    libcgroup-dev \
    make \
    libpcre3 libpcre3-dev \
    libmysqlclient-dev

RUN cd /usr/local/src/ && git clone -b v2.1.2 https://github.com/matsumotory/ngx_mruby.git
ENV NGINX_CONFIG_OPT_ENV \
      --with-http_stub_status_module \
      --with-http_ssl_module --prefix=/usr/local/nginx \
      --with-http_realip_module \
      --with-http_addition_module \
      --with-http_sub_module \
      --with-http_gunzip_module \
      --with-http_gzip_static_module \
      --with-http_random_index_module \
      --with-http_secure_link_module
RUN cd /usr/local/src/ngx_mruby && sh build.sh && make install

EXPOSE 80
EXPOSE 443

ONBUILD ADD docker/hook /usr/local/nginx/hook
ONBUILD ADD docker/conf /usr/local/nginx/conf
ONBUILD ADD docker/conf/nginx.conf /usr/local/nginx/conf/nginx.conf

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
