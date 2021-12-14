class VerifyPage

    def initialize(page)
        @NAME_AT_MIDDLE = '/html/body/div/div/div[4]/div[2]/div/div[2]/h2'
        @NAME_AT_TOP_RIGHT = '/html/body/div/div/div[4]/div[1]/div/div/div/span'
        @VERIFY_BTN = "/html/body/div/div/div[4]/div[2]/div/div[3]/div/div/div[2]/button"
        @CLOSE_SESSION_BTN = "/html/body/div/div/div[4]/div[2]/div/div[3]/div/div/div[1]/button"
        @REQUEST_BTN = "/html/body/div/div/div[4]/div[2]/div/div[3]/div/div/div[3]/button"
        @TOP_RIGHT_CLOSE_SESSION_BTN = '/html/body/div/div/div[4]/div[1]/div/div/div/div/div'
        @MIDDLE_CLOSE_SESSION_BTN ='/html/body/div/div/div[4]/div[2]/div/div[3]/div/div/div[1]/button'
        @page = page
    end


    def clickNameAtTheTopRigth()
        @page.find(:xpath, @NAME_AT_TOP_RIGHT).click
    end
    
    def clickTopRightCloseSessionBtn()
        @page.find(:xpath, @TOP_RIGHT_CLOSE_SESSION_BTN).click
        return  InitialPage.new(@page)
    end

    def clickMiddleCloseSessionBtn()
        @page.find(:xpath, @MIDDLE_CLOSE_SESSION_BTN ).click
        return  InitialPage.new(@page)
    end

    def clickVerifyBtn()
        buttonLabel = @page.find(:xpath,@VERIFY_BTN).click
        return HomePage.new(@page)
    end

    def validateAccountNameAtTheMiddle()
        name = @page.find(:xpath, @NAME_AT_MIDDLE).text
        if not name.include? "duslan marinero"
            raise "Expected the username 'duslan marinero' in the middle of the screen"
        end
    end

    def validateAccountAtNameTheTopRight()
        name = @page.find(:xpath, @NAME_AT_TOP_RIGHT).text
        if not name === "duslan marinero"
            raise "Expected the username 'duslan marinero' in the middle of the screen"
        end
    end

    def validateVerifyBtn()
        buttonLabel = @page.find(:xpath,@VERIFY_BTN).text
        if buttonLabel  != 'Verificar Acceso'
            raise "Expected button Verificar Acceso isn't in the page"
        end
    end


    def validateCloseSessionBtn()
        buttonLabel = @page.find(:xpath, @CLOSE_SESSION_BTN).text
        if buttonLabel  != 'Cerrar Sesion'
            raise "Expected button Cerrar Sesion isn't in the page"
        end
    end


    def validateRequestBtn()
        buttonLabel = @page.find(:xpath,@REQUEST_BTN).text
        if buttonLabel  != 'Solicitar'
            raise "Expected button Solicitar isn't in the page"
        end
    end
end
