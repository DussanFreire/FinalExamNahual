Before do
  @verifyPage = VerifyPage.new(page)
end

Given('I click on my name which is in the top-left parat of the screen') do
  @verifyPage.clickNameAtTheTopRigth()
end
  
When('I click in the Cerrar Sesión button') do
  @initialPage = @verifyPage.clickTopRightCloseSessionBtn()
end

When('I click on the button Cerrar Sesion') do
  @initialPage = @verifyPage.clickMiddleCloseSessionBtn()
end

Then('I should be on the initial page of nauhal') do
end

Then("I should see the text 'Para continuar debe iniciar sesión' in the middle of the screen") do
  @initialPage.validateCenterMessage()
end

Then('I should see the button Iniciar Sesión') do
  @initialPage.validateLoginBtn()
end

