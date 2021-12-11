Feature: As a Nahul user          
        I want see all the egresades in the Empresas page
        so easily see all the registerd egresades

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
Scenario: View the Empresas page
   Given I am on the home page
   When I click the button Empresas
   Then I should see the title Lista Egresades on the top of the page
   And I should a button named Filtrar
   And I should a button named Exportar
   And I should see a table of egresades with the following columns
      | 1 | NOMBRE Y APELLIDO | 
      | 2 | CORREO |
      | 3 | TELEFONO |
      | 4 | NODO |
      | 5 | MÓDULOS CURSADOS |
      | 6 | NIVEL DE INGLES |