pipeline {
   agent {
       docker {
           image 'ruby'
           args '--network skynet'
       }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Compilando e/ou bainxado dependências'
            sh 'bundle install'
         }
      }
      stage('Test') {
         steps {
            echo 'Executando testes'
            sh 'rspec -fd --format RspecJunitFormatter --out rspec.xml'
         }
         post {
            always {
               junit 'rspec.xml'
            }
         }
      }
      stage('UAT') {
         steps {
            echo 'Testes de aceitação'
            input message: 'Podemos ir para produção?'
         }
      }
      stage('Prod') {
         steps {
            echo 'App pronto para produção!'
         }
      }
   }
}
