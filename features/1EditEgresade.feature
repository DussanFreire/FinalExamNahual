Feature: As a Nahul administrator          
        I want to edit the information of one egresade
        so I keep the information up to date

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
Scenario: Edit multiple fields
    Given I am on the Nahual Egresades page
    When I click the button Editar of the user named "Sexto Grupo No Eliminar"
    And I edit the fields as show below
        |Nombre         | Jager |
        |Apellido       | Vargas Rejas |
        |Tipo Documentacion     | CI |
        |Documentacion  | 1235789 |        
    And I click in the Confirmar Button
    Then I should see the list name "Lista Egresades" at the middle of the page
    And Clicking on Ver button of the edited egresade
    And I should see the data changed on the single card of the egresade    
