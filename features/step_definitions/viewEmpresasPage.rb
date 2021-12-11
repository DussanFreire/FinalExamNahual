
When('I click the button Empresas') do
    find(:xpath,'/html/body/div/div/div[4]/div[2]/div/div[1]/a[4]/a').click
end

Then('I should see the title Lista Egresades on the top of the page') do
    text = find(:xpath,'/html/body/div/div/div[4]/div[2]/div/div[2]/h2/div').text
    if text != 'Lista Egresades'
        raise 'Expected to see the title Lista Egresades'
    end
end

Then('I should a button named Filtrar') do
    if not page.has_css?('#root > div > div.ui.container > div.app > div > div.pusher > div.ui.segment > div > div.divider.text',text: "Filtrar")
        raise 'Expected to see a filter button'
    end
end

Then('I should a button named Exportar') do
    if not page.has_css?('#root > div > div.ui.container > div.app > div > div.pusher > div:nth-child(4) > div > button',text: "Exportar")
        raise 'Expected to see a Exportar button'
    end
end

Then('I should see a table of egresades with the following columns') do |table|
    sleep(3)
    data = table.rows_hash
    data.each_pair do |key, value|
        case value    
            when "NOMBRE Y APELLIDO"
                index = key.to_i + 1
                data = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr/th[#{index}]").text
                if data != value.upcase      
                    raise "Expected to see the complete name #{value} in the field NOMBRE Y APELLIDO"
                end
            when "CORREO"
                index = key.to_i + 1
                data = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr/th[#{index}]").text
                if data != value.upcase  
                    raise "Expected to see the date #{value} in the field CORREO"
                end
            when "TELEFONO"
                index = key.to_i + 1
                data = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr/th[#{index}]").text
                if data != value.upcase      
                    raise "Expected to see the email #{value} in the field TELEFONO"
                end
            when "NODO"
                index = key.to_i + 1
                data = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr/th[#{index}]").text
                if data != value.upcase      
                    raise "Expected to see the phone number #{value} in the field NODO"
                end
            when "MÓDULOS CURSADOS"
                index = key.to_i + 1
                data = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr/th[#{index}]").text
                if data != value.upcase      
                    raise "Expected to see the SEDE #{value} in the field MÓDULOS CURSADOS" 
                end

            when "NIVEL DE INGLES"
                index = key.to_i + 1
                data = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/thead/tr/th[#{index}]").text
                if data != value.upcase      
                    raise "Expected to see the SEDE #{value} in the field NIVEL DE INGLES" 
                end
        end
    end
end