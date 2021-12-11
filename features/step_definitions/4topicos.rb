Given('I click the button Cursos') do
    click_on('Cursos')
end

Given('I am on the Nahual Cursos page') do
    puts('I am on the cursos page')
end

Given('I click the button Topicos') do
    click_on('Topicos')
end

When('I click the button Topico +') do
    click_on('Topico')
end

When('I fill the field with the name {string}') do |topic|
    @topic = topic
    fill_in 'Topico', :with => topic
end

When('I click the button Crear') do
    click_on('Crear')
    sleep(1)
end

Then('I should see a message that confirm the creation of my topic') do
    message= "Tópico creado con éxito"
    expect(page).to have_content(message)
    confirm = "Se creó el Tópico: "+@topic
    expect(page).to have_content(confirm)
end

Then('I could see the topic on the list of topics') do
    expect(page).to have_content('Testing Topic Grupo 6')
    sleep(2)
end

When('I click the button Eliminar of the topic {string}') do |string|
    @topic=string
    td = page.find(:css, 'td', text: /#{string}/)
    puts('Lo encontre',td.text)
    tr = td.find(:xpath, './parent::tr') 
    puts('Lo encontre',tr.text)
    tr.find(:xpath,'./td[3]/div/button[2]').click
end
  
When('I click the confirmar button') do
    click_on('Confirmar')
end
  
Then('I should see a message that confirm the delete of the topic') do
    message= "Tópico eliminado con éxito"
    expect(page).to have_content(message)
    confirm = "Se eliminó el Tópico: "+@topic
    expect(page).to have_content(confirm)
end

When('I click the button Editar of the topic {string}') do |string|
    @topic=string
    td = page.find(:css, 'td', text: /#{string}/)
    tr = td.find(:xpath, './parent::tr') 
    tr.find(:xpath,'./td[3]/div/button[1]').click
end
  
When('I click the Editar button') do
    page.find(:xpath, '/html/body/div[2]/div/div[2]/form/button[2]').click
end
  
Then('I should see a message that confirm the edition of the topic') do
    message= "Tópico editado con éxito"
    expect(page).to have_content(message)
    confirm = "Se editó el Tópico a: "+@topic
    expect(page).to have_content(confirm)
end
Then('I should see the table of {string}') do |tableName|
    nameTable=find(:xpath, '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/div[1]/h2/div').text
    if nameTable  != tableName
        raise "Expected table name does not match with expected"
    end
    puts('The Table is the same')
end

Then('I can also see the topic in the table with the modification') do
    expect(page).to have_content(@topic)
    sleep(2)
end