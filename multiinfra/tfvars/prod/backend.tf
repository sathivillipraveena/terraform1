bucket = "secure-state-test"
key    = "secure"
region = "us-east-1"
encrypt  = true  # for state file locking when the file is executing 
use_lockfile = true    # remote state file needs locking system when the terraform code is being changed 


