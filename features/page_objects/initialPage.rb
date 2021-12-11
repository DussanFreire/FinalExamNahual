class InitialPage
    def initialize(page) 
        @iniciarSesionBtn = '/html/body/div/div/div[4]/div[2]/div/button'
        @loginWithGooglePage = LoginWithGooglePage.new(page)  
        @page = page
    end 

    def iniciarSesion()
        @page.find(:xpath, @iniciarSesionBtn).click
        return @loginWithGooglePage
    end

end