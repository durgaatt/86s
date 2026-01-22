    bucket = "s3bukt-remote-state-file-dev"
    key    = "remote-state-demo"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true

    #terraform.exe init  -backend-config=dev/backend.tf
    #terraform.exe plan -var-file=dev/dev.tfvars