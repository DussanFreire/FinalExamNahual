class LoginWithGooglePage

    def initialize(page)
        @LOGIN_BTN = '/html/body/div/div/div[2]/form/div/div/div/div/div[2]/div[2]/span/div/div/div/div/div/div/div/div/div/div/div[1]/a/div[2]'
        @emailFieldPage = EmailFieldPage.new(page)  
        @page = page
    end

    def iniciarSesionConGoogle()
        @page.find(:xpath, @LOGIN_BTN).click
        return @emailFieldPage
    end
end
