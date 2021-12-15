Before do
    @homePage = HomePage.new(page)
end

When('I click the Cursos button') do
    @cursosPage = @homePage.clickOnCursosBtn()
end
#Scenario: Delete a course
Given('I am on the Nahual Cursos') do
end

When('I click on Eliminar button of the first course in the course list') do
    @cursosPage.clickOnTheFirstRowDeleteBtn()
end

When('I click on Confirmar button') do
    @cursosPage.clickOnTheConfirmBtn()
end

Then('I should see a message of confirmation') do
    @cursosPage.validateConfirmationMessage()
end

#Scenario: See Inactive courses

When('I click on Active state menu') do
    @cursosPage.clickActivateStateBtn()
end

When('I click on Inactive option') do
    @cursosPage.clickInactivateStateBtn()
end

Then('I should see the inactive list and state') do
    @cursosPage.validateInactiveListAndState()
end

#Scenario: Create a course

When('I click Nuevo Curso button form') do
    @cursosPage.clickNewClassBtn()
end

When('I enter the Period 1') do
    @cursosPage.enterThePeriodOne()
end

When('I click Topico options') do
    @cursosPage.clickTopicBtn()
end

When('I select the first Topico') do
    @cursosPage.selectFirstTopic()
end

When('I click Sede - Nodo options') do
    @cursosPage.clickSedeNodoOpt()
end

When('I select the first Sede - Nodo') do
    @cursosPage.clickFirstSedeNodo()
end

When('I choose the schedule {string}') do |string|
    @cursosPage.chooseSchedule(string)
end

When('I enter the profesor {string}') do |string|
    @cursosPage.enterTheProfesor(string)
end

When('I write notas {string}') do |string|
    @cursosPage.writeNotas(string)
end

When('I click confirmar button') do
    xpathBase= find(:xpath,"/html/body/div[2]/div/div[3]/button[2]").click
end

Then('I should see a message of correct Curso creation') do
    messageLabel = find(:xpath,"/html/body/div/div/div[2]/div/div/div").text
    if messageLabel != 'Curso creado con éxito'
        raise "Expected confirmation of creation"
    end
end