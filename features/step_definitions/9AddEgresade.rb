Before do
  @egresadePage = EgresadesPage.new(page)
end

Given('I click the button Importar') do
  @egresadePage.clickOnTheImportBtn()
end
  
Given('I had charge a csv file with the Egresade {string}') do |string|
  @egresadePage.chargeCSV(string)
end
  
Given('I have already charged the csv file') do
end
  
When('I click the button Confirar') do
  @egresadePage.clickConfirmarImportBtn()
end
  
Then('I should see a success message named Registro exitoso!') do
  @egresadePage.validateSuccessMessage() 
end

Then('The content of the message should be Se realizo el registro de 1 egresados exitosamente.') do
  @egresadePage.validateSuccessMessageContent() 
end

Then('The user just added should be in the egresades list.') do
  @egresadePage.findEgresadeOnTheList() 
end

Then('I should see the table empty') do
  @egresadePage.validateEmptyTable()
end


# escenario 2

Given('I am in the import page') do
end

When('I charge a csv with the wrong Node and Cede fields') do
  @egresadePage.chargeWrongCSV()
end

Then('I should see a warning message with the title Error de carga!') do
  @egresadePage.validateWarningMessage()
end

Then('I should see the following content of the error Error de formato en la columna Nodos o Sedes, verifique la informacion..') do
  @egresadePage.validateWaningMessageContent()
end

Then('it should be, in the bottom part of the page, the text No se cargo ningun archivo') do
  @egresadePage.validateNotFilledStatus()
end

# escenario 3

Then('the input of the csv file filled with the csv that I just charged') do
  @egresadePage.validateCSVNameOnceCharged()
end

Then('I should see in the bottom of the page a preview') do |table|
  @egresadePage.validatePreviewContentOfImport(table)
end