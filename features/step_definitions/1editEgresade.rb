When('I click the button Editar of the user named {string}') do |string|
  td = page.find(:css, 'div.ui.label.nombre', text: /#{string}/)
  tr = td.find(:xpath, './parent::td/parent::tr') 
  tr.find(:xpath,'./td[5]/a[1]/button').click
end
  
When('I edit the fields as show below') do |table|
  sleep(3) 
  data = table.rows_hash
  @rowCounter = 0
  data.each_pair do |key, value|
      if value.to_i >0
          @rowCounter +=1
      end 
      case key
        when "Nombre"
          fill_in 'nombre', :with => value
          @nombreCompleto = value
          @nombre = value
        when "Apellido"
          fill_in 'apellido', :with => value
          @nombreCompleto += ' '+value
          @apellido = value
        when "Tipo Documentacion"
          fill_in 'tipoDNI', :with => value
          @tipoDNI=value 
        when "Documentacion"
          fill_in 'dni', :with => value
          @docu=value
        end	
      end 
  puts(@nombreCompleto)
end
  
When('I click in the Confirmar Button') do
  click_on('Confirmar')
  sleep(1)
end

Then('I should see the list name {string} at the middle of the page') do |tableName|
  nameTable=find(:xpath, '/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[1]/h2/div').text
  if nameTable  != tableName
      raise "Expected List Name does not match with expected"
  end
  puts('The Table is the same')
end
Then('Clicking on Ver button of the edited egresade') do
  td = page.find(:css, 'div.ui.label.nombre', text: /#{@nombreCompleto}/)
  tr = td.find(:xpath, './parent::td/parent::tr') 
  tr.find(:xpath,'./td[5]/button[1]').click
end
Then('I should see the data changed on the single card of the egresade') do
  sleep(1) 
  nameComplete =find(:xpath, '/html/body/div[2]/div/div[1]/div/div[2]/h1').text
  if nameComplete != @nombreCompleto
    raise "Nombre y Apellido in Card does not match with expected"
  end
  documentationType =find(:xpath, '/html/body/div[2]/div/div[2]/div/div[1]/div[2]/div/div/div/div/form/div[4]/div').text
  if documentationType != @tipoDNI
    raise "Tipo Documentacion in Card does not match with expected"
  end
  doc =find(:xpath, '/html/body/div[2]/div/div[2]/div/div[1]/div[2]/div/div/div/div/form/div[3]/div').text
  if doc != @docu
    raise "Documentacion in Card does not match with expected"
  end
  click_on('Cerrar')
end

