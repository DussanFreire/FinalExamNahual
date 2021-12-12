class InitialPage
    def initialize(page) 
        @loginWithGooglePage = LoginWithGooglePage.new(page)  
        @CENTER_MESSAGE = '/html/body/div/div/div[4]/div[2]/div/div[2]/h4'
        @LOGIN_BTN = '/html/body/div/div/div[4]/div[2]/div/button'
        @page = page
    end 

    def iniciarSesion()
        @page.find(:xpath, @LOGIN_BTN).click
        return @loginWithGooglePage
    end

    def validateCenterMessage()
        textMessage = @page.find(:xpath,@CENTER_MESSAGE ).text
        if textMessage !='Para continuar debe iniciar sesión.'
            raise "This page must have the text 'Para continuar debe iniciar sesión' in the middle of the screen'"
        end
    end

    def validateLoginBtn()
        loginButtonText = @page.find(:xpath, @LOGIN_BTN).text
        if loginButtonText !='Iniciar Sesión'
            raise "This page must have a button 'Iniciar Sesión'"
        end
    end
end