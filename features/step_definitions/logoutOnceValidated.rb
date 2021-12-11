Given('I click on my name which is in the top-left parat of the screen') do
  find(:xpath, '/html/body/div/div/div[4]/div[1]/div/div/div').click
end
  
When('I click in the Cerrar Sesión button') do
  find(:xpath, '/html/body/div/div/div[4]/div[1]/div/div/div/div/div').click
end

When('I click on the button Cerrar Sesion') do
  find(:xpath, '/html/body/div/div/div[4]/div[2]/div/div[3]/div/div/div[1]/button').click
end

Then('I should be on the initial page of nauhal') do
end

Then("I should see the text 'Para continuar debe iniciar sesión' in the middle of the screen") do
  textMessage = find(:xpath, '/html/body/div/div/div[4]/div[2]/div/div[2]/h4').text
  if textMessage !='Para continuar debe iniciar sesión.'
    raise "This page must have the text 'Para continuar debe iniciar sesión' in the middle of the screen'"
  end
end

Then('I should see the button Iniciar Sesión') do
  loginButtonText = find(:xpath, '/html/body/div/div/div[4]/div[2]/div/button').text
  if loginButtonText !='Iniciar Sesión'
    raise "This page must have a button 'Iniciar Sesión'"
  end
  puts 'se logro deslogearse'
end

