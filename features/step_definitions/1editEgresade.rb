Before do
  @egresadesPage = EgresadesPage.new(page)
end

When('I click the button Editar of the user named {string}') do |string|
  @egresadesPage.clickInTheEditButtonOfAnEgresade(string)
end
  
When('I edit the fields as show below') do |table|
  @egresadesPage.editFieldsOfFormsOfEdition(table)
end
  
When('I click in the Confirmar Button') do
  @egresadesPage.clickOnConfirmBTN()
end

Then('I should see the list name {string} at the middle of the page') do |tableName|
  @egresadesPage.validateListaEgresade(tableName)
end
Then('Clicking on Ver button of the edited egresade') do
  @egresadesPage.clickOnVerEgresadeBtn()
end
Then('I should see the data changed on the single card of the egresade') do
  @egresadesPage.validateThatTheDataHasChanged()
end

