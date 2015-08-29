server: bundle
	open http://0.0.0.0:4567
	bundle exec middleman server

build: bundle
	bundle exec middleman build --verbose

clean:
	rm -frv publish

bundle:
	bundle install --path vendor/bundle

.PHONY: build, server, clean, bundle
