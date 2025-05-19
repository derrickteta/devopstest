This repository contains all code, configurations, and documentation for the DevOps technical test.

## Steps Followed

1. **Repository Setup**  
   Create a public GitHub repository for the test, including a `README.md` file.

2. **Local Environment Setup**  
   Clone the repository to the local machine and open it in **VS Code**.

3. **Terraform Directory**  
   Create a folder named `Terraform` to hold all Terraform-related files.

4. **Terraform Configuration File**  
   Inside the `terraform` folder, create a `main.tf` file to define all Terraform configurations.

5. **Provider Setup & Project Creation**  
   In `main.tf`, configure the Google Cloud provider and define the resource to create a new GCP project.

6. **Version Control**  
   Add and commit all files using Git with appropriate commit messages.
    ```bash
       git add .
       git commit -m "creation of the main.tf file, selection of the provider, and creation of the project"
    ```
   
8. **Authentication to GCP (Without Existing Project)**  
   Use the following command to authenticate to Google Cloud using **Application Default Credentials**:
   ```bash
   gcloud auth application-default login --no-launch-browser 
   ```
9. **Launch Terraform**
    ```bash
       cd Terraform/
       terraform init 
       terraform plan  # error on the project ID, replace the capital O letter with the O letter
       terraform apply # add 123 to project id to make it unique and solve error of project creation
       git add .
       git commit -m "run terraform apply, change the project id to solve the creation error, add other terraform file to the gitignore"
    ```
10. **Creation of a service account**
   now that we have created a project let's configure a service account to use:
   - GCP console => IAM and Admin => service Account => create service account
   - authenticate using the service account 
   - doc https://cloud.google.com/sdk/gcloud/reference/auth/activate-service-account
    ```bash
       gcloud auth activate-service-account automation@devops-test-project123.iam.gserviceaccount.com --key-file=devops-test-project123-83429cfd0b6a.json --project=devops-test-project123
    ```
11. **Creation of cloud Sql instance**
   - add the creation configuration in `main.tf`
   - Launch Terraform
    ```bash
       terraform plan  
       terraform apply 
       git add .
       git commit -m "add the config of cloud sql instance creation to main.tf, run terraform plan and apply"
    ```

11. **Creation of  CloudStorage bucket**
   - add the creation configuration in `main.tf`
   - Launch Terraform
   ``` bash
       terraform plan  
       terraform apply 
       git add .
       git commit -m " add the config of  Cloud Storage bucket creation to main.tf, run terraform plan and apply"
   ```

12. **Creation of an artifact registry in GCP**
   - enabling Artifact Registry in the GCP console API
   - doc https://console.developers.google.com/apis/api/artifactregistry.googleapis.com/overview?project=devops-test-project123
   - add the creation configuration in `main.tf`
   - Launch Terraform
   ```bash
         terraform plan
         terraform apply
         git add .
         git commit -m "add the config of artifact registry creation to main.tf, run terraform plan and apply"
   ```

13. **Creation of the image in the artifact registry**
   - creation of the file start.sh that contains the script launching php-frp and nginx in the container
   - creation of the src folder that contains the file index.php of our hello world!
   - creation of nginx.conf that contains the configuration of nginx for serving static files and proxying requests to the PHP-FPM
   - creation of the dockerfile 
 
   ```bash
       docker build -t php-fpm-nginx-app .
       docker run -d -p 8080:8080 php-fpm-nginx-app
       curl http://localhost:8080 # to check that the file is served
       gcloud auth configure-docker us-central1-docker.pkg.dev
       docker tag php-fpm-nginx-app us-central1-docker.pkg.dev/devops-test-project123/devops-test-repo123/php-nginx-app:v1
       docker push us-central1-docker.pkg.dev/devops-test-project123/devops-test-repo123/php-nginx-app:v1
       git add .
       git commit -m "creation of the image and push it to the artifact registry in GCP"
   ```

14. **Github Action Workflow**
      - go to the project on github => github action => search cloud_run => on Build and Deploy to Cloud Run, click configure => modify the generated code with our elements and commit changes.
      - go to GCP console:
      - IAM and Admin => workload Identity pool and provider => new workload provider and pool
      ```bash
         git add .
         git commit -m "creation of the workflow for of build, push a Docker container to Google Artifact Registry and deploy it on Cloud Run when a commit is pushed to the main branch."
      ```
  
    
