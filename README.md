# ngx-mruby-docker

https://hub.docker.com/r/saboyutaka/ngx-mruby

* nginx 1.15.1
* ngx-mruby v2.1.1

## Usage

```bash
$ docker run --rm -p 80:80 -v `pwd`/docker/conf/nginx.conf:/usr/local/nginx/conf/nginx.conf -v `pwd`/docker/hook:/usr/local/nginx/hook saboyutaka/ngx-mruby
```
