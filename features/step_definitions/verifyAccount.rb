
Given('I am on the Nahual verify page') do
  puts('se encuentra en la pagina inicial')
end

When('I click the button Verificar Acceso') do
  find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[3]/div/div/div[2]/button").click
  puts('se encuentra en la verificacion de acceso')
end

Then('I should see the a welcome') do
  welcomeText = find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[2]/div/h3").text
  puts('welcomeText', welcomeText)
  if welcomeText  != "¡ Gracias por confiar en nosotres y ser parte del Proyecto Nahual !"
      raise "Expected the welcome message: '¡ Gracias por confiar en nosotres y ser parte del Proyecto Nahual '"
  end
  puts('Exito en la validacion de cuenta')
end

Then('I should see the Home button at the left part of the page') do
  buttonLabel = find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[1]/a[1]/a/p").text
  if buttonLabel  != "Home"
    raise "Expected the Home button at the left part of the page'"
  end
end

Then('I should see the Egresades button at the left part of the page') do
  buttonLabel = find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[1]/a[2]/a/p").text
  if buttonLabel  != "Egresades"
    raise "Expected the Egresades button at the left part of the page'"
  end
end

Then('I should see the Cursos button at the left part of the page') do
  buttonLabel = find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[1]/a[3]/a/p").text
  if buttonLabel  != "Cursos"
    raise "Expected the Cursos button at the left part of the page'"
  end
end

Then('I should see the Empresas button at the left part of the page') do
  buttonLabel = find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[1]/a[4]/a/p").text
  if buttonLabel  != "Empresas"
    raise "Expected the Empresas button at the left part of the page'"
  end
end
