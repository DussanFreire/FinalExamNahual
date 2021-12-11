Feature: As a Nahul user          
        I want add an egresade     
        so I can have an update list of egresades

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
   And I click the button Importar

Scenario: load a csv with one egresade named "Henry Torrico"
   Given I am in the import page
   When I had charge a csv file with the Egresade "Henry Torrico"
   Then the input of the csv file filled with the csv that I just charged
   And I should see in the bottom of the page a preview
   	| Nombre y Apellido | Henry Torrico |
      | Fecha de Nacimiento | 8/21/1997 |
      | Mail | henry@gmail.com |
      | Numero de Celular | 78306201 |
      | SEDE | Intive |
      | NODO | CABA |

@smoke
Scenario: Add an egresade with a csv with the right "Node" and "Cede" fields and a quantity of lines below to 200
   Given I had charge a csv file with the Egresade "Henry Torrico"
   When I click the button Confirar
   Then I should see a success message named Registro exitoso!
   And The content of the message should be Se realizo el registro de 1 egresados exitosamente.
   And The user just added should be in the egresades list.

Scenario: Add an egresade with a csv with the wrong Node and Cede fields and a quantity of lines below to 200
   Given I am in the import page
   When I charge a csv with the wrong Node and Cede fields
   Then I should see a warning message with the title Error de carga!
   And I should see the following content of the error Error de formato en la columna Nodos o Sedes, verifique la informacion..
   And it should be, in the bottom part of the page, the text No se cargo ningun archivo