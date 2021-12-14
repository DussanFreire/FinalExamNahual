Before do
  @verifyPage = VerifyPage.new(page)
end

Given('I am on the Nahual verify page') do
end

When('I click the button Verificar Acceso') do
  @homePage = @verifyPage.clickVerifyBtn()
end

Then('I should see the a welcome') do
  @homePage.validateHomeBtn()
end

Then('I should see the Home button at the left part of the page') do
  @homePage.validateHomeBtn()
end

Then('I should see the Egresades button at the left part of the page') do
  @homePage.validateEgresadesBtn()
end

Then('I should see the Cursos button at the left part of the page') do
  @homePage.validateCursosBtn()
end

Then('I should see the Empresas button at the left part of the page') do
  @homePage.validateEmpresasBtn()
end
