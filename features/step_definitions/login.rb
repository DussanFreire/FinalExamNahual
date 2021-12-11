Given("I am on the Nahual intial page") do
    page.driver.browser.manage.window.maximize
        visit 'https://nahual-argentina-develop.vercel.app/'
end

When('I click the Iniciar Sesión button') do
    click_on ('Iniciar Sesión')
end

When('I click on the Iniciar con Google button') do
    find(:xpath, "/html/body/div/div/div[2]/form/div/div/div/div/div[2]/div[2]/span/div/div/div/div/div/div/div/div/div/div/div[1]/a/div[2]").click
end

When('I add my email') do
    fill_in 'identifierId', :with => ENV['EMAIL']
end
When('I click on the Siguiente button') do
    xpathBase= find(:xpath, "/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div[1]/div/div/button/span").click
end

When('I add my password') do
    fill_in 'password', :with => ENV['PSW']
end

When('I click on the button Siguiente') do
    xpathBase= find(:xpath, "/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div[1]/div/div/button/span").click
end

Then('I should see the name of my google account in the middle of the page') do
    name = find(:xpath, '/html/body/div/div/div[4]/div[2]/div/div[2]/h2').text
    if not name.include? "duslan marinero"
        raise "Expected the username 'duslan marinero' in the middle of the screen"
    end
end 

Then('I should see the name of my google account in the top-right of the page') do
    name = find(:xpath, '/html/body/div/div/div[4]/div[1]/div/div/div/span').text
    if not name === "duslan marinero"
        raise "Expected the username 'duslan marinero' in the middle of the screen"
    end
end 


Then('I should see the button Verificar Acceso') do
    buttonLabel = find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[3]/div/div/div[2]/button").text
    if buttonLabel  != 'Verificar Acceso'
        raise "Expected button Verificar Acceso isn't in the page"
    end
end

Then('I should see the button Cerrar Sesion') do
    buttonLabel = find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[3]/div/div/div[1]/button").text
    if buttonLabel  != 'Cerrar Sesion'
        raise "Expected button Cerrar Sesion isn't in the page"
    end
    puts('Login Exitoso')
end


Then('I should see the button Solicitar') do
    buttonLabel = find(:xpath,"/html/body/div/div/div[4]/div[2]/div/div[3]/div/div/div[3]/button").text
    if buttonLabel  != 'Solicitar'
        raise "Expected button Solicitar isn't in the page"
    end
    puts('Login Exitoso')
end

