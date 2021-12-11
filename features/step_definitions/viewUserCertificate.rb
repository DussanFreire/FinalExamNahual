@nodo = ''
@user = ''

Given('I click the button Egresades') do
  find(:xpath, '//*[@id="root"]/div/div[4]/div[2]/div/div[1]/a[2]/a').click
end

Given('I am on the Nahual Egresades page') do
  puts 'I am on the Nahual Egresades page'
end

When('I click the button Certificado of the user named {string}') do |string|
  @user = string
  cuantityOfPages = page.all('div.ui.pagination.menu > a.item').count
  elementFound = ''
  for pag in 1..cuantityOfPages do
    sleep(3)
    cuantityOfRows = page.all('tbody > tr').count
    for index in 1..cuantityOfRows do
      dir = "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/tbody/tr[#{index}]/td[1]/div[1]"
      elementFound = find(:xpath, dir).text
      if elementFound === string
        @nodo = find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/tbody/tr[#{index}]/td[2]/div").text
        find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/tbody/tr[#{index}]/td[5]/a[2]/button").click
        break
      end
    end
    if elementFound === string
      break
    end
    find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[6]/a[4]").click
  end
  if elementFound != string
    raise 'Expected to have the user on the list of egresades.'
  end
end


Then('I should see the certificate of the user') do
  sleep(5)
end

Then('I should see the name of the user on the certificate') do 
  certificateName = find(:xpath,'/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/h1').text
  if certificateName != @user
    raise "Expected the #{@user} name on the certificate"
  end
  puts('Exito en la vista del certificado')
end

Then('I should see the name of the nodo name on the certificate') do
  certificateNodo = find(:xpath,'/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/h2').text
  if certificateNodo != @nodo[2..].upcase
    raise "Expected the #{@nodo[2..].upcase} nodo name on the certificate"
  end
  puts('Exito en la vista del certificado')
end