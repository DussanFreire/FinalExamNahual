Given("I am on the Nahual intial page") do
    page.driver.browser.manage.window.maximize
        visit 'https://nahual-argentina-develop.vercel.app/'
end

Before do
    @initialPage = InitialPage.new(page)
end

When('I click the Iniciar Sesión button') do
    @loginWithGooglePage = @initialPage.iniciarSesion()
end

When('I click on the Iniciar con Google button') do
    @emailFieldPage = @loginWithGooglePage.iniciarSesionConGoogle()
end

When('I add my email') do
    @emailFieldPage.fillEmail(ENV['EMAIL'])
end
When('I click on the Siguiente button') do
    @passwordFieldPage = @emailFieldPage.goToTheNextStep()
end

When('I add my password') do
    @passwordFieldPage.fillPassword(ENV['PSW'])
end

When('I click on the button Siguiente') do
    @verifyPage = @passwordFieldPage.goToTheNextStep()
end

Then('I should see the name of my google account in the middle of the page') do
    @verifyPage.validateAccountNameAtTheMiddle()
end 

Then('I should see the name of my google account in the top-right of the page') do
    @verifyPage.validateAccountAtNameTheTopRight()
end 


Then('I should see the button Verificar Acceso') do
    @verifyPage.validateVerifyBtn()
end

Then('I should see the button Cerrar Sesion') do
    @verifyPage.validateCloseSessionBtn()
end


Then('I should see the button Solicitar') do
    @verifyPage.validateRequestBtn()
end

