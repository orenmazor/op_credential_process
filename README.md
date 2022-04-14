# Abstract

The AWS CLI supports a `credential_process` parameter that allows you to specify where credentials come from.

This is pretty handy because you dont want to put your credentials in .aws/credentials.

For more information on the credential_process, start [with the AWS documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sourcing-external.html).

# Usage

This script expects you to have a 1Password account and the 1Password CLI tool, which can be gotten [from the 1Password Command Line Tool website](https://1password.com/downloads/command-line/).

You can use any type of 1P account (business, teams, whatever). All that matters is that you have an item with at least two fields, `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.

The other thing you need to do is to set up your aws/config file as follows:

```
[profile oren]
region=us-east-1
credential_process=/Users/orenmazor/Projects/op_credentials_process/op_credentials_process.bash my.1password.com aws-example
```

You can now use tools that respect that flag, such as [granted](https://docs.commonfate.io/granted/introduction/)
