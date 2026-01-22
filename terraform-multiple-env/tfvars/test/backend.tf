    bucket = "s3bukt-remote-state-file-test"
    key    = "remote-state-demo"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true

    #terraform.exe init  -backend-config=test/backend.tf
    #terraform.exe plan -var-file=test/test.tfvars