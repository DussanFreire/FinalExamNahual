Given('I am on the home page') do
end

Then('I should see the title Lista Egresades') do
    text = find(:xpath,'/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[1]/h2/div').text
    if text != 'Lista Egresades'
        raise 'Expected to see the title Lista Egresades'
    end
end

Then('I should see a search field') do
    if not page.has_css?('#root > div > div.ui.container > div.app > div > div.pusher > div > div.tabla > div.tabla-menu > div.ui.search > div > input')
        raise 'Expected to see a search field'
    end
end

Then('I should see a filter button') do
    if not page.has_css?('#root > div > div.ui.container > div.app > div > div.pusher > div > div.tabla > div.ui.button.floating.labeled.dropdown.icon > div.divider.text',text: "Egresade")
        raise 'Expected to see a filter button'
    end
end

Then('I should a button named Importar') do
    if not page.has_css?('#root > div > div.ui.container > div.app > div > div.pusher > div > div.tabla > div.tabla-menu > div.registrar > div > button',text: "Importar")
        raise 'Expected to see a button named Importar'
    end
end

Then('I should see a table with the following columns') do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
        case value    
            when "Nombre y Apellido"
                data = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/thead/tr/th[#{key}]").text
                puts data
                if data != value.upcase      
                    raise "Expected to see the complete name #{value} in the field Nombre y apellido"
                end
            when "NODO"
                data = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/thead/tr/th[#{key}]").text
                if data != value.upcase  
                    raise "Expected to see the date #{value} in the field NODO"
                end
            when "SEDE"
                data = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/thead/tr/th[#{key}]").text
                if data != value.upcase      
                    raise "Expected to see the email #{value} in the field SEDE"
                end
            when "ESTADO"
                data = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/thead/tr/th[#{key}]").text
                if data != value.upcase      
                    raise "Expected to see the phone number #{value} in the field ESTADO"
                end
            when "ACCIÓN"
                data = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/thead/tr/th[#{key}]").text
                if data != value.upcase      
                    raise "Expected to see the SEDE #{value} in the field ACCIÓN" 
                end
        end
    end
end