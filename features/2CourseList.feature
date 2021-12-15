Feature: As a Nahual user   
        I want to manage the list of courses
        so students can enroll in the courses      

Background:
   Given I am on the Nahual intial page
   And I click the Iniciar Sesión button
   And I click on the Iniciar con Google button
   And I add my email
   And I click on the Siguiente button
   And I add my password
   And I click on the button Siguiente
   And I click the button Verificar Acceso
   And I click the Cursos button

@smoke
Scenario: Create Curso
    Given I am on the Nahual Cursos
    And I click Nuevo Curso button form
    And I enter the Period 1
    And I click Topico options
    And I select the first Topico
    And I click Sede - Nodo options
    And I select the first Sede - Nodo
    And I choose the schedule "12:00 - 13:30"
    And I enter the profesor "Julio Prado"
    And I write notas "Nota prueba"
    And I click confirmar button
    Then I should see a message of correct Curso creation

@smoke
Scenario: Delete a course
    Given I am on the Nahual Cursos
    When I click on Eliminar button of the first course in the course list
    And I click on Confirmar button
    Then I should see a message of confirmation

@confirmation_test
Scenario: See Inactive courses
    Given I am on the Nahual Cursos
    When I click on Active state menu
    And I click on Inactive option
    Then I should see the inactive list and state