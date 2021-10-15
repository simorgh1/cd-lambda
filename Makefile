SOURCE := "sample-app-source"

.PHONY: build upload test deploy
all: build test

build:
		${INFO} "Building sample-app package ..."
		@ cd app/ && pip3 install -r requirements.txt && serverless plugin install -n serverless-python-requirements --stage staging
		${INFO} "Building sample-app package complete"

upload:
		${INFO} "Uploading sample-app package ..."
		@ zip -x ".git/*" -x "app/.serverless/*" -x "app/node_modules/*" -r package.zip .
		@ aws s3api put-object --bucket $(SOURCE) --key package.zip --body package.zip --no-cli-pager
		@ rm package.zip
		${INFO} "Uploading sample-app package complete"

deploy:
		${INFO} "Deploying sample-app lambda ..."
		@ serverless deploy -s staging
		${INFO} "Deploying sample-app lambda complete"

# Cosmetics
YELLOW := "\e[1;33m"
NC := "\e[0m"

# Shell Functions
INFO := @bash -c '\
  printf $(YELLOW); \
  echo "=> $$1"; \
  printf $(NC)' SOME_VALUE
