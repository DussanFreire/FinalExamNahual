
When('I click the button Ver of the user named {string}') do |string|
    td = page.find(:css, 'div.ui.label.nombre', text: /#{string}/)
    tr = td.find(:xpath, './parent::td/parent::tr') 
    tr.find(:xpath,'./td[5]/button[1]').click
end

Then('I should see the name {string}') do |string|
    title = find(:xpath,"/html/body/div[2]/div/div[1]/div/div[2]/h1").text
    if title  != string
        raise "Expected {string}"
    end
    puts('Exito')
end