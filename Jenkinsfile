pipeline
 {
  agent { label 'sla' 

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
               
    }
}
 }
