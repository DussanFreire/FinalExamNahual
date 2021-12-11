Feature: As a Nahul user          
        I want to see the Nahual certificate of an  registered user     
        so I can check if that person has done the curse

Background:
   Given I am on the Nahual intial page
   And I click the Iniciar Sesión button
   And I click on the Iniciar con Google button
   And I add my email
   And I click on the Siguiente button
   And I add my password
   And I click on the button Siguiente
   And I click the button Verificar Acceso
   And I click the button Egresades
   
@smoke
Scenario: View a user certificate of an user located in the first page of the table
   Given I am on the Nahual Egresades page
   When I click the button Certificado of the user named "Juslan Vargas"
   Then I should see the certificate of the user
   And I should see the name of the user on the certificate
   And I should see the name of the nodo name on the certificate
   
Scenario: View a user certificate of an user located in the last page of the table
   Given I am on the Nahual Egresades page
   When I click the button Certificado of the user named "Mahi Simpson Flanders"
   Then I should see the certificate of the user
   And I should see the name of the user on the certificate
   And I should see the name of the nodo name on the certificate