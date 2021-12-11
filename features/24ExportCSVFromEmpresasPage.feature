Feature: As a Nahul user          
        I want to export a csv table of the egresades
        so I can use it in oher apps

Background:
   Given I am on the Nahual intial page
   And I click the Iniciar Sesión button
   And I click on the Iniciar con Google button
   And I add my email
   And I click on the Siguiente button
   And I add my password
   And I click on the button Siguiente
   And I click the button Verificar Acceso
   And I click the button Empresas

Scenario: Exporrt CSV
   Given I mark the egresade "Sexto Grupo No Eliminar"
   When I click the button exportar
   Then I should export the csv with only one user