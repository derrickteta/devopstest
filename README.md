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
8. **Launch Terraform for the first time**
    ```bash
       cd Terraform/
       terraform init 
       terraform plan  # error on the project id, replace of the capital O letter to o letter
    ```


 