Feature: As a Nahul user          
        I want see all the egresades in the egresades page
        so easily see all the registerde egresades

Background:
   Given I am on the Nahual intial page
   And I click the Iniciar Sesión button
   And I click on the Iniciar con Google button
   And I add my email
   And I click on the Siguiente button
   And I add my password
   And I click on the button Siguiente
   And I click the button Verificar Acceso

@smoke
Scenario: View the Egresades page
   Given I am on the home page
   When I click the button Egresades
   Then I should see the title Lista Egresades
   And I should see a search field
   And I should see a filter button
   And I should a button named Importar
   And I should see a table with the following columns
      | 1 | NOMBRE Y APELLIDO | 
      | 2 | NODO |
      | 3 | SEDE |
      | 4 | ESTADO |
      | 5 | ACCIÓN |