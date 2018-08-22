.DEFAULT_GOAL := help

run : ## Run nginx
	docker run --rm -it -p 80:80 -v `pwd`/docker/conf/nginx.conf:/usr/local/nginx/conf/nginx.conf -v `pwd`/docker/hook:/usr/local/nginx/hook saboyutaka/ngx-mruby

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
