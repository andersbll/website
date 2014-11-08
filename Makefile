.PHONY: site serve deploy clean

HOST = thinlinc2.compute.dtu.dk
WWW_ROOT = www/
WWW_EXCLUDE = files
BUILDARGS =

site:
	jekyll build $(BUILDARGS)

serve:
	jekyll serve --watch $(BUILDARGS)

deploy: BUILDARGS=--config _config.yml,_config_deploy.yml
deploy: clean site
	rsync --compress --recursive --checksum --itemize-changes --delete --exclude=$(WWW_EXCLUDE) -e ssh _site/ $(HOST):$(WWW_ROOT)

clean:
	rm -rf _site
