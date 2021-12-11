Given('I click the button Nodos Sedes') do
    click_on('Nodos Sedes')
end

When('I click the button Nodo +') do
    click_on('Nodo')
end

When('I fill the field of node with the name {string}') do |node|
    @node = node
    fill_in 'nodo', :with => node
end
Then('I should see the Text of Nodos & Sedes at the middle of the page') do 
    sleep(3)
    nameTable=find(:xpath, '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/div/div/div[1]/h2/div').text
    if nameTable  != 'Nodos & Sedes'
        raise "Expected List name does not match with expected"
    end
    puts('The List name is the same')
end
Then('I can see the new node on in the list of nodes') do
    expect(page).to have_content(@node)
    sleep(2)
end

Then('I should see an alert message that says {string}') do |message|
    text = page.driver.browser.switch_to.alert.text
    expect(text).to eq message
    sleep(2)
end
