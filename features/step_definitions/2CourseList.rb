When('I click the Cursos button') do
    xpathBase= find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[1]/a[3]/a").click
end

#Scenario: Delete a course

Given('I am on the Nahual Cursos') do
    puts 'I am on the Nahual Cursos page'
end

When('I click on Eliminar button of the first course in the course list') do
    xpathBase= find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[2]/table/tbody/tr[1]/td[7]/div/button[2]").click
end

When('I click on Confirmar button') do
    xpathBase= find(:xpath,"/html/body/div[2]/div/div[3]/div/button[2]").click
end

Then('I should see a message of confirmation') do
    messageLabel = find(:xpath,"/html/body/div/div/div[2]/div/div/div/p").text
    if messageLabel  != 'Curso eliminado con éxito'
        raise "Expected message of confirmation"
    end
    puts('Exito')
end

#Scenario: See Inactive courses

When('I click on Active state menu') do
    xpathBase= find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[2]/div[4]/div/div[2]").click
end

When('I click on Inactive option') do
    xpathBase= find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[2]/div[4]/div/div[2]/div[2]/div[2]").click
end

Then('I should see the inactive list and state') do
    state = find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[2]/div[4]/div/div[2]/div[1]").text
    if state != 'Inactivo'
        raise "Expected Inactivo state"
    end
    puts('Exito')
end

#Scenario: Create a course

When('I click Nuevo Curso button form') do
    xpathBase= find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[2]/div[4]/button").click
end

When('I enter the Period 1') do
    xpathBase= find(:xpath,"/html/body/div[2]/div/div[2]/form/div[2]/div/input").set "1"
end

When('I click Topico options') do
    xpathBase= find(:xpath,"/html/body/div[2]/div/div[2]/form/div[5]/div").click
end

When('I select the first Topico') do
    xpathBase= find(:xpath,"/html/body/div[2]/div/div[2]/form/div[5]/div/div[2]/div[1]").click
end

When('I click Sede - Nodo options') do
    xpathBase= find(:xpath,"/html/body/div[2]/div/div[2]/form/div[6]/div").click
end

When('I select the first Sede - Nodo') do
    xpathBase= find(:xpath,"/html/body/div[2]/div/div[2]/form/div[6]/div/div[2]/div[1]").click
end

When('I choose the schedule {string}') do |string|
    xpathBase= find(:xpath,"/html/body/div[2]/div/div[2]/form/div[7]/div/input").set string
end

When('I enter the profesor {string}') do |string|
    xpathBase= find(:xpath,"/html/body/div[2]/div/div[2]/form/div[8]/div/input").set string
end

When('I write notas {string}') do |string|
    xpathBase= find(:xpath,"/html/body/div[2]/div/div[2]/form/div[9]/textarea").set string
end

When('I click confirmar button') do
    xpathBase= find(:xpath,"/html/body/div[2]/div/div[3]/button[2]").click
end

Then('I should see a message of correct Curso creation') do
    messageLabel = find(:xpath,"/html/body/div/div/div[2]/div/div/div").text
    if messageLabel != 'Curso creado con éxito'
        raise "Expected confirmation of creation"
    end
    puts('Exito')
end