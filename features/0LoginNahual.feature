Feature: As a Google user          
         I want to login in the web page of nahual          
         so I can request access to the app or verify my account and login  
@smoke
Scenario: Login with a google account 
    Given I am on the Nahual intial page
    When I click the Iniciar Sesión button
    And I click on the Iniciar con Google button
    And I add my email
    And I click on the Siguiente button
    And I add my password
    And I click on the button Siguiente
    Then I should see the name of my google account in the middle of the page
    And I should see the name of my google account in the top-right of the page
    And I should see the button Verificar Acceso
    And I should see the button Solicitar
    And I should see the button Cerrar Sesion