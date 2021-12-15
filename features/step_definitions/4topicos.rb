Before do
    @homePage = HomePage.new(page)
end

Given('I click the button Cursos') do
    @cursosPage = @homePage.clickOnCursosBtn()
end

Given('I am on the Nahual Cursos page') do
end

When('I click the button Topicos') do
    @cursosPage.clickTopicosBtn()
end

When('I click the button Topico +') do
    @cursosPage.clickTopicosBtnn()
end

When('I fill the field with the name {string}') do |topic|
    @cursosPage.fillTheFieldName(topic)
end

When('I click the button Crear') do
    @cursosPage.clickCreateTopicBtn()
end

Then('I should see a message that confirm the creation of my topic') do
    @cursosPage.validateTopicConfirmationMessage()
end

Then('I could see the topic on the list of topics') do
    @cursosPage.validateTheTopicInTheListOfTopics()
end

When('I click the button Eliminar of the topic {string}') do |string|
    @cursosPage.clickDeleteTopicOfTopics(string)
end
  
When('I click the confirmar button') do
    @cursosPage.clickInConfirmDeteleBtn()
end
  
Then('I should see a message that confirm the delete of the topic') do
    @cursosPage.validateDeleteConfirmation()
end

When('I click the button Editar of the topic {string}') do |string|
    @cursosPage.clickInTheEditBtn(string)
end
  
When('I click the Editar button') do
    @cursosPage.clickOnTheEditBtn()
end
  
Then('I should see a message that confirm the edition of the topic') do
    @cursosPage.validateEditionConfirmationMessage()
end

Then('I should see the table of {string}') do |tableName|
    @cursosPage.validateTable(tableName)
end

Then('I can also see the topic in the table with the modification') do
    @cursosPage.validateModification()
end