SOURCE := $$(cat ../.cf/template.yaml | shyaml get-value Parameters.SourceBucketName.Default)

.PHONY: upload deploy test remove
all: deploy test

upload:
		${INFO} "Uploading sample-app package ..."
		@ zip -x ".git/*" -x ".serverless/*" -x "node_modules/*" -r package.zip .
		@ aws s3api put-object --bucket $(SOURCE) --key package.zip --body package.zip --no-cli-pager
		@ rm package.zip
		${INFO} "Uploading sample-app package complete"

deploy:
		${INFO} "Deploying sample-app lambda ..."
		@ serverless deploy -s dev && serverless info
		${INFO} "Deploying sample-app lambda complete"

test:
		${INFO} "Testing sample-app hello method ..."
		@ serverless invoke --function hello
		${INFO} "hello logs ..."
		@ serverless logs --function hello
		${INFO} "Testing sample-app hello complete"

remove:
		${INFO} "Removing sample-app hello method ..."
		@ serverless remove
		${INFO} "Removing sample-app Complete"

# Cosmetics
YELLOW := "\e[1;33m"
NC := "\e[0m"

# Shell Functions
INFO := @bash -c '\
  printf $(YELLOW); \
  echo "=> $$1"; \
  printf $(NC)' SOME_VALUE
