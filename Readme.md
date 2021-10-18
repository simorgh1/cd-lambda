# CI/CD for aws lambda

![Visits Badge](https://badges.pufler.dev/visits/simorgh1/cd-lambda)
[![GitHub license](https://img.shields.io/github/license/simorgh1/cd-lambda)](https://github.com/simorgh1/cd-lambda/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/simorgh1/cd-lambda)](https://github.com/simorgh1/cd-lambda/stargazers)
![Twitter Follow](https://img.shields.io/twitter/follow/bahrammaravandi?style=social)
![LinkedIn Follow](https://shields.io/badge/style-bahram.maravandi-black?logo=linkedin&label=LinkedIn&link=https://www.linkedin.com/in/bahram.maravandi)

Stargaze ![GitHub Repo stars](https://img.shields.io/github/stars/simorgh1/cd-lambda?style=social) if you find it useful.

CodePipeline CI/CD template and build script for a sample aws lambda application.

### Working in Dev Container

Sample lambda application was created by [serverless framework](https://www.serverless.com) and python3. CodePipeline is a managed aws service and the provided infrastructure as code cloudformation templates is applied using aws cli.
This tools are aleady pre-installed in the [development container](https://microsoft.github.io/code-with-engineering-playbook/developer-experience/devcontainers/), which could be used in vscode.

### Requirments

- **Visual Code** [install](https://code.visualstudio.com/Download)
- **Docker** [install](https://docs.docker.com/engine/install/)
- **AWS account** [account](https://aws.amazon.com)

### Getting started

After cloning this repository, open the folder in vscode, it will propmpt you to open the folder inside the configured devcontainer, this will startup the devcontainer. First startup will take a little longer since the docker container image needs to be built, then inside the vscode, open a terminal and it will open in the project working folder.

### CI/CD Workflow

![Workflow](ci-cd-lambda.png)

After [configuring](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) the aws cli with the valid credentials, create the ci/cd pipeline.

IaC is located in .cf folder, where a cloudformation template describing the required resources for building the pipeline is stored. A Makefile, simlyfies the build process here as well, open a terminal in this folder and run:

```bash
.cf/: make create
```

There are also update and remove targets defined for upcomming updates in the pipeline or for cleaning up the created resources at the end.

For triggering the pipeline, switch to app folder, which is a hello-world lambda function writen in python3 using serverless framework. Then run the upload command, which will copy all required artifacts to the defined s3 source bucket, this will then trigger the pipeline that deploys the lambda function.

For testing, hello function is invoked after deployment and the corresponding logs are printed.
