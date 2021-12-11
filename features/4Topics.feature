Feature: As a Nahual user          
        I want to have topics
        so I can divide better the courses
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
Scenario: Create a new topic with a correct name
    Given I am on the Nahual Cursos page
    And I click the button Topicos
    When I click the button Topico +
    And I fill the field with the name "Testing Topic Grupo 6"
    And I click the button Crear
    Then I should see a message that confirm the creation of my topic
    And I could see the topic on the list of topics

@smoke
Scenario: Edit the name of a topic
    Given I am on the Nahual Cursos page
    And I click the button Topicos
    When I click the button Editar of the topic "Testing Topic Grupo 6"
    And I fill the field with the name "Edited Grupo 6"
    And I click the Editar button
    Then I should see a message that confirm the edition of the topic
    And I should see the table of "Topicos"
    And I can also see the topic in the table with the modification

@smoke
Scenario: Delete a topic
    Given I am on the Nahual Cursos page
    And I click the button Topicos
    When I click the button Eliminar of the topic "Edited Grupo 6"
    And I click the confirmar button
    Then I should see a message that confirm the delete of the topic
    
