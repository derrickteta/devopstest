This repository contains all code, configurations, and documentation for the DevOps technical test.

## Steps Followed

1. **Repository Setup**  
   Created a public GitHub repository for the test, including a `README.md` file.

2. **Local Environment Setup**  
   Cloned the repository to my local machine and opened it in **VS Code**.

3. **Terraform Directory**  
   Created a folder named `Terraform` to hold all Terraform-related files.

4. **Terraform Configuration File**  
   Inside the `terraform` folder, created a `main.tf` file to define all Terraform configurations.

5. **Provider Setup & Project Creation**  
   In `main.tf`, configured the Google Cloud provider and defined the resource to create a new GCP project.

6. **Version Control**  
   Added and committed all files using Git with appropriate commit messages.

7. **Authentication to GCP (Without Existing Project)**  
   Used the following command to authenticate to Google Cloud using **Application Default Credentials**:
   ```bash
   gcloud auth application-default login --no-launch-browser
   past the 
   ```
8. **Launch Terraform**
    ```bash
       cd Terraform/
       terraform init 
       terraform plan  # error on the project id, replace of the capital O letter to o letter
       terraform apply # add 123 to project id to make it unique and solve error of project creation
       git add 
       git commit -m "run terraform apply, change the project id to solve the creation error, add other terraform file to the gitignore"
    ```

9. **Creation of cloud Sql instance**
   add the creation configuration in ``main.tf`` 
   Launch Terraform
   ```bash
       terraform plan  
       terraform apply 
       git add .
       git commmit -m " add the config of cloud sql instance creation to main.tf, run terraform plan and apply"
    ```
    