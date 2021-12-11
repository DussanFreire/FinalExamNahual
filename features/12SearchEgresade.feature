Feature: As a Nahul user          
        I want to search an specific user on the egresades list
        so I can easiily find a user

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
Scenario: Find a egresade that is on the egresades list 
   Given I am in the egresades page
   When I fill the search field with "Sexto Grupo No Eliminar"
   Then I should see in the first row the user "Sexto Grupo No Eliminar"
   
Scenario: Find a egresade that isn't on the egresades list 
   Given I am in the egresades page
   When I fill the search field with "no en la lista"
   Then I should see the table empty