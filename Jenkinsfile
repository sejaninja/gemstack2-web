pipeline {
   agent {
       docker {
           image 'qaninja/ruby-selenium'
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
            sh 'cucumber -p ci -t @smoke'
         }
         post {
            always {
               cucumber failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'logs', pendingStepsNumber: -1, skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
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
