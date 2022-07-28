# Bitops Plugin for AWS

## Table of contents

1. [Introduction](#Introduction)
2. [Installation](https://github.com/bitops-plugins/aws/blob/main/INSTALL.md)
3. [Deployment](#Deployment)

---

## Introduction
This is one of the required plugins that sets credentials for AWS to run deployments using BitOps.


## Deployment


### CLI Configuration

```AWS_ACCESS_KEY_ID```, ```AWS_SECRET_ACCESS_KEY``` and ```AWS_DEFAULT_REGION``` are the mandatory configs that are required to use AWS plugin for BitOps.

When using AWS temporary credentials, ```AWS_SESSION_TOKEN``` is a required config.

### Sample Docker Run

```
docker run --rm --name bitops \
-e AWS_ACCESS_KEY_ID="${BITOPS_AWS_ACCESS_KEY_ID}" \
-e AWS_SECRET_ACCESS_KEY="${BITOPS_AWS_SECRET_ACCESS_KEY}" \
-e AWS_DEFAULT_REGION="${BITOPS_AWS_DEFAULT_REGION}" \
-e BITOPS_ENVIRONMENT="${ENVIRONMENT}" \
-v $(pwd):/opt/bitops_deployment \
bitops-core:latest

```