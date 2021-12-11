@userAdded = ''

Given('I click the button Importar') do
    find(:xpath, '/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[4]/div[2]/div/button').click
end
  
Given('I had charge a csv file with the Egresade {string}') do |string|
  @userAdded = string
  Capybara.ignore_hidden_elements = false
  sleep(4)
  el =  find(:xpath, '/html/body/div[2]/div/div[2]/div[2]/input')
  el.attach_file('path\OneEgresade.csv')
  sleep(3)
end
  
Given('I have already charged the csv file') do
end
  
When('I click the button Confirar') do
  find(:xpath, '/html/body/div[2]/div/div[4]/button[2]').click
end
  
Then('I should see a success message named Registro exitoso!') do
  message = find(:xpath,'/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[3]/div/div/div').text
  if message != "Registro exitoso!"
    raise "Expected the success mesage Registro exitoso" 
  end
end

Then('The content of the message should be Se realizo el registro de 1 egresados exitosamente.') do
  message = find(:xpath,'/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[3]/div/div/p').text
  if message!= "Se realizo el registro de 1 egresados exitosamente."
    raise "Expected the success mesage Se realizo el registro de 1 egresados exitosamente." 
  end
end

Then('The user just added should be in the egresades list.') do
  cuantityOfPages = page.all('div.ui.pagination.menu > a.item').count
  elementFound = ''
  for pag in 1..cuantityOfPages do
    sleep(3)
    cuantityOfRows = page.all('tbody > tr').count
    for index in 1..cuantityOfRows do
      dir = "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/tbody/tr[#{index}]/td[1]/div[1]"
      elementFound = find(:xpath, dir).text
      if elementFound === @userAdded
        break
      end
    end
    if elementFound === @userAdded
      break
    end
    find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[6]/a[4]").click
  end
  if @userAdded != elementFound
    raise 'Expected the user just added to be in the egresades list.'
  end
end

Then('I should see the table empty') do
  cuantityOfRows = page.all('tbody > tr').count
  if cuantityOfRows > 0
    raise 'Expected to see an empty table'
  end
end


# escenario 2

Given('I am in the import page') do
end

When('I charge a csv with the wrong Node and Cede fields') do
  Capybara.ignore_hidden_elements = false
  sleep(4)
  el =  find(:xpath, '/html/body/div[2]/div/div[2]/div[2]/input')
  el.attach_file('path\OneEgresadeWrongNodoAndSede.csv')
end

Then('I should see a warning message with the title Error de carga!') do
  warningTitle =  find(:xpath, '/html/body/div[2]/div/div[2]/div[1]/div/div/div').text
  if warningTitle != 'Error de carga!'
    raise 'Expected to see a warning message with the title Error de carga!'
  end
end

Then('I should see the following content of the error Error de formato en la columna Nodos o Sedes, verifique la informacion..') do
  warningMessage =  find(:xpath, '/html/body/div[2]/div/div[2]/div[1]/div/div/p').text
  if warningMessage != 'Error de formato en la columna Nodos o Sedes, verifique la informacion..'
    raise 'Expected to see the following content of the error Error de formato en la columna Nodos o Sedes, verifique la informacion..'
  end
end

Then('it should be, in the bottom part of the page, the text No se cargo ningun archivo') do
  status =  find(:xpath, '/html/body/div[2]/div/div[4]/h1').text
  if status != 'No se cargo ningun archivo'
    raise 'Expected to see in the bottom part of the page the text No se cargo ningun archivo'
  end
end

# escenario 3

Then('the input of the csv file filled with the csv that I just charged') do
  fileName = find(:xpath, '/html/body/div[2]/div/div[2]/div[2]/div/div/div[2]/span[2]').text
  if fileName != 'OneEgresade.csv'
    raise 'Expexted the input of the csv file filled with the csv'
  end
end

Then('I should see in the bottom of the page a preview') do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
      when "Nombre y Apellido"
        data = find(:xpath, '/html/body/div[2]/div/div[4]/table/tbody/tr/td[1]').text
        if data != value
          raise "Expected to see the complete name #{value} in the field Nombre y apellido"
        end
      when "Fecha de Nacimiento"
        data = find(:xpath, '/html/body/div[2]/div/div[4]/table/tbody/tr/td[2]').text
        if data != value
          raise "Expected to see the date #{value} in the field Fecha de Nacimiento"
        end
      when "Mail"
        data = find(:xpath, '/html/body/div[2]/div/div[4]/table/tbody/tr/td[3]').text
        if data != value
          raise "Expected to see the email #{value} in the field Mail"
        end
      when "Numero de Celular"
        data = find(:xpath, '/html/body/div[2]/div/div[4]/table/tbody/tr/td[4]').text
        if data != value
          raise "Expected to see the phone number #{value} in the field Numero de Celular"
        end
      when "SEDE"
        data = find(:xpath, '/html/body/div[2]/div/div[4]/table/tbody/tr/td[5]').text
        if data != value
          raise "Expected to see the SEDE #{value} in the field SEDE" 
        end
      when "NODO"
        data = find(:xpath, '/html/body/div[2]/div/div[4]/table/tbody/tr/td[6]').text
        if data != value
          raise "Expected to see the NODO #{value} in the field NODO"
        end
    end
  end
end