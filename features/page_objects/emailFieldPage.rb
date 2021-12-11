class EmailFieldPage

    def initialize(page)
        @EMAIL_FIELD = '/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div/form/span/section/div/div/div[1]/div/div[1]/div/div[1]/input'
        @NEXT_BTN_EMAIL = '/html/body/div[1]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div[1]/div/div/button/span'
        @passwordFieldPage = PasswordFieldPage.new(page)  
        @page = page
    end
    
    def fillEmail(email)
        @page.find(:xpath,@EMAIL_FIELD).fill_in with: email
        @page.find(:xpath, @NEXT_BTN_EMAIL).click
    end


    def goToTheNextStep()
        @page.find(:xpath, @NEXT_BTN_EMAIL).click
        return @passwordFieldPage
    end

end
