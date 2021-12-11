Feature: As a Nahul user          
        I want to have Nodos 
        so I can sectorize better the place of my curses

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
Scenario: Create a Nodo with a non-empty name
    Given I am on the Nahual Cursos page
    And I click the button Nodos Sedes
    When I click the button Nodo +
    And I fill the field of node with the name "Testing Nodo 5 Grupo 6"
    And I click the button Crear
    Then I can see the new node on in the list of nodes

Scenario: Create a Nodo with empty name
    Given I am on the Nahual Cursos page
    And I click the button Nodos Sedes
    When I click the button Nodo +
    And I fill the field of node with the name ""
    And I click the button Crear
    Then I should see an alert message that says "Los datos no pueden viajar vacios!"