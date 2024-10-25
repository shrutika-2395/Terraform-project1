pipeline {
    agent any

    stages {
        stage('Cloning github repo') {
            steps {
checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/shrutika-2395/Terraform-project1.git']])
            }
        }
    
        stage ("terraform init") {
            steps {
                sh ("terraform init -reconfigure") 
            }
        }
        
        stage ("terraform Plan") {
            steps {
                sh ("terraform plan -out=my_plan.tfplan") 
            }
        }
        
        stage ("terraform apply") {
            steps {
                sh ("terraform apply my_plan.tfplan") 
            }
        }
        
        stage (" Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
           }
        }
    }
}
