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
9. **Creation of a service account**
   now that we have created a project let's configure a service account to use:
   - gcp console => IAM and Admin => service Account => create service account
   - authenticate using the service account 
   - doc https://cloud.google.com/sdk/gcloud/reference/auth/activate-service-account
    ```bash
       gcloud auth activate-service-account automation@devops-test-project123.iam.gserviceaccount.com --key-file=devops-test-project123-83429cfd0b6a.json --project=devops-test-project123
    ```
10. **Creation of cloud Sql instance**
   - add the creation configuration in ``main.tf`` 
   - Launch Terraform

   ```bash
         terraform plan  
         terraform apply 
         git add .
         git commit -m " add the config of cloud sql instance creation to main.tf, run terraform plan and apply"
    ```

11. **Creation of  CloudStorage bucket**
   add the creation configuration in ``main.tf`` 
   Launch Terraform
   ```bash
       terraform plan  
       terraform apply 
       git add .
       git commit -m " add the config of  Cloud Storage bucket creation to main.tf, run terraform plan and apply"
    ```

12. **Creation of an artefact registry in gcp**
   - enabling Artifact Registry in the gcp console API #https://console.developers.google.com/apis/api/artifactregistry.googleapis.com/overview?project=devops-test-project123

   add the creation configuration in ``main.tf`` 
   Launch Terraform
   ```bash
       terraform plan  
       terraform apply 
       git add .
       git commit -m "add the config of artefact registry creation to main.tf, run terraform plan and apply"
    ```

13. **Creation of the image in the artefact registry**
   - creation of the file start.sh that content the script lauching php-frp and nginx in the container
   - creation of the src folder that content the file index.php of our hello world!
   - creation of nginx.conf that contents the configuration of nginx for serving static files and proxying requests to the PHP-FPM
   - creation of the dockerfile 
   ```bash
       docker build -t php-fpm-nginx-app .
       docker run -d -p 8080:8080 php-fpm-nginx-app
       curl http://localhost:8080 # to check that the file is served
       gcloud auth configure-docker us-central1-docker.pkg.dev
       docker tag php-fpm-nginx-app us-central1-docker.pkg.dev/devops-test-project123/devops-test-repo123/php-nginx-app:v1
       docker push us-central1-docker.pkg.dev/devops-test-project123/devops-test-repo123/php-nginx-app:v1
       git add .
       git commit -m "creation of the image and push it to the artefact registry in gcp"
    ```
    
14. **Github Action Workflow**
      - go to the project on github => github action => search cloud_run => on Build and Deploy to Cloud Run, click configure => modify the generated code with our elements and commit changes.
      - go to gcp console:
        IAM and Admin => workload Identity pool and provider => new workload provider and pool
      ```bash
      git add .
      git commit -m "creation of the workflow for of build and push a Docker container to Google Artifact Registry and deploy it on Cloud Run when a commit is pushed to the main branch."

      ```
  
    