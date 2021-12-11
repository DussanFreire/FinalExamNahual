Feature: As a Nahul user          
        I want to logout from my account once I have logged in 
        so I can be sure that no one will be able to access my account without the password

Background:
   Given I am on the Nahual intial page
   And I click the Iniciar Sesión button
   And I click on the Iniciar con Google button
   And I add my email
   And I click on the Siguiente button
   And I add my password
   And I click on the button Siguiente

@smoke
Scenario: Logout with the button at the top left part of the screen 
   Given I am on the Nahual verify page
   And I click on my name which is in the top-left parat of the screen
   When I click in the Cerrar Sesión button
   Then I should be on the initial page of nauhal
   And I should see the text 'Para continuar debe iniciar sesión' in the middle of the screen
   And I should see the button Iniciar Sesión

@smoke
Scenario: Logout with the button at the top middle part of the screen 
   Given I am on the Nahual verify page
   When I click on the button Cerrar Sesion 
   Then I should be on the initial page of nauhal
   And I should see the text 'Para continuar debe iniciar sesión' in the middle of the screen
   And I should see the button Iniciar Sesión