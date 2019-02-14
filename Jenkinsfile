pipeline
 {
    agent any

    stages 
{
      
        stage ('Compile Stage') 
{

            steps
 {
               
                    sh 'mvn -f pom.xml clean install'
                
            }
        }

        stage ('Testing Stage')
 {

            steps
 {
                
                    sh 'mvn -f pom.xml test'
                }
            
        }
        stage('Deploy to Tomcat')
{
        steps
 {
        sh 'cp -r /root/.jenkins/workspace/project6/target/* /opt/apache-tomcat-8.5.3/webapps/'
        }
        }


        
    }
}
