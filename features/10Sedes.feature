Feature: As a Nahul user          
        I want to have Sedes in my Nodes 
        so I can sectorize and describe better the place of my curses

Background:
   Given I am on the Nahual intial page
   And I click the Iniciar Sesión button
   And I click on the Iniciar con Google button
   And I add my email
   And I click on the Siguiente button
   And I add my password
   And I click on the button Siguiente
   And I click the button Verificar Acceso
   And I click the button Cursos

@smoke
Scenario: Create a Sede in one Node
    Given I am on the Nahual Cursos page
    And I click the button Nodos Sedes
    When I click the button Sede+ of the Nodo "Testing Nodo 5 Grupo 6"
    And I fill the Sede field with "Sede Grupo 6"
    And I click the button Crear
    Then I can see the new Sede in the list of sedes of the node "Testing Nodo 5 Grupo 6"

@smoke
Scenario: Edit Sede name
    Given I am on the Nahual Cursos page
    And I click the button Nodos Sedes
    When I click the button Editar of the Sede "Sede Grupo 6" in the Nodo "Testing Nodo 5 Grupo 6"
    And I fill the Sede edit field with "Sede Grupo 6 editado"
    And I click the button Editar
    Then I can see the Sede with the name edited in the list of sedes of the node "Testing Nodo 5 Grupo 6"
