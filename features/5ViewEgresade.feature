Feature: As a Nahual user   
        I want to see an Egresade
        so I can check his information      

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
Scenario: See an Egresade
    Given I am on the Nahual Egresades page
    When I click the button Ver of the user named "Sexto Grupo No Eliminar"
    Then I should see the name "Sexto Grupo No Eliminar"
