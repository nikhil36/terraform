# Terraform
Repository for learning Terraform


Steps to get started:

1. Run `terraform init`     -   This command initializes terraform in the current directory and downloads the providers needed in the terraform code.

2. Run `terraform apply`    -   This will read the terraform code file and show the changes that will be made once the change is applied. In our case, this will be the S3 bucket creation details.
                                This command will automatically generate the plan and make changes. 

3. Run `terraform plan`     -   This command will compare the current state of the system and the changes that will happen if you apply the code change.
                                This is great for verifying the changes that will be applied due to current changes in code.

4. Run `terraform plan -out=sample.plan`    -   This command generates a plan file which can be used to apply. This will also make sure that you only apply the changes that were part of a,
                                                This avoids mistakes due to unintended changes in the script after generating the plan.   
                                            -   The plan file (sample.plan) can only be viewed by running `terraform show sample.plan` since its a binary file.
                                        
4. Run `terraform apply "sample.plan"` - This command applies changes from a specific plan.

5. Run `terraform plan -destroy -out destroy.plan` - Generate the plan
    `terraform apply destroy.plan` - Execute the plan
    
   Good to clean up resources after ending a development session.



<br></br>
<h2> Terraform States </h2>

- State define the current state of the resource or local representation of the state file.

- The state file can be inspected for the most recent execution by running `vi terraform.tfstate`

- Only running `terraform plan`, terraform refreshes the local state file based on the remote changes.

- Remote storage for states is used for colloborative development.

- Useful commands:
    1. `terraform state list` - Display the resources that have been provisioned.
    2. `terraform state show <resource name> ` - Provides a detailed view about a provisioned resource.
    3. `terraform show` - Displays a full list of resources in details.


    
