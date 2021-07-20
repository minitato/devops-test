# devops-test

## Before to run
```shell
    go mod init module/m && go mod tidy
```

## Terratest
```shell
    go test -v
```

## Create AWS S3 with timestamp in files
```shell
    terraform apply
```

## Report

I could not advance tests in github actions (pipeline) and solve with short time, that generating problem like this: https://github.com/aws-actions/configure-aws-credentials/issues/188