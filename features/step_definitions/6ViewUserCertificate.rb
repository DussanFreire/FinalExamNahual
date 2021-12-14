Before do
  @homePage = HomePage.new(page)
end

Given('I click the button Egresades') do
  @egresadesPage = @homePage.clickOnEgresadeBtn()
end

Given('I am on the Nahual Egresades page') do
end

When('I click the button Certificado of the user named {string}') do |string|
  @certificatePage = @egresadesPage.clickOnTheCertificateOfAnEgresade(string)
end


Then('I should see the certificate of the user') do
  sleep(5)
end

Then('I should see the name of the user on the certificate') do 
  @certificatePage.validateCertificateName()
end

Then('I should see the name of the nodo name on the certificate') do
  @certificatePage.validateCertificateNodo()
end