When('I click the button Sede+ of the Nodo {string}') do |string|
    sleep(3)
    div = page.find(:css, 'tbody > tr > td > div > div > div.column', text: /#{string}/)
    tr = div.find(:xpath, './parent::div/parent::div/parent::td/parent::tr') 
    tr.find(:xpath,'./td[1]/div/div/div[2]/button').click
end
When('I fill the Sede field with {string}') do |sede|
    @sede=sede
    fill_in 'nodo', :with => sede
end
  
Then('I can see the new Sede in the list of sedes of the node {string}') do |string|
    sleep(2)
    expect(page).to have_content(@sede)
end


When('I click the button Editar of the Sede {string} in the Nodo {string}') do |string, string2|
    sleep(1)
    div = page.find(:css, 'tbody > tr > td > div > div > div.column', text: /#{string2}/)
    tr = div.find(:xpath, './parent::div/parent::div/parent::td/parent::tr') 
    tr.find(:xpath,'./td[3]/div/div/div/td/div/button[1]').click
end

When('I click the button Editar') do
    page.find(:xpath, '/html/body/div[2]/div/div[3]/button[2]').click
end

When('I fill the Sede edit field with {string}') do |string|
    @sede=string
    fill_in 'nodo', :with => string
end

Then('I can see the Sede with the name edited in the list of sedes of the node {string}') do |string|
    sleep(2)
    expect(page).to have_content(@sede)
end