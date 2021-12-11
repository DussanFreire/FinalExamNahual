class PasswordFieldPage

    def initialize(page)
        @PASSWORD_FIELD = '/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div/form/span/section/div/div/div[2]/div[1]/div/div/div/div/div[1]/div/div[1]/input'
        @NEXT_BTN_PASS = '/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div[1]/div/div/button'
        @verifyPage = VerifyPage.new(page)
        @page = page
    end
    
    def fillPassword(password)
        @page.fill_in 'password',:with =>  password
    end
    
    def goToTheNextStep()
        @page.find(:xpath, @NEXT_BTN_PASS).click
        return @verifyPage
    end

end
