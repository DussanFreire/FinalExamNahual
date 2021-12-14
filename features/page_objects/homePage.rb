class HomePage

    def initialize(page)
        @WELCOME_TEXT = '/html/body/div/div/div[4]/div[2]/div/div[2]/div/h3'
        @HOME_BTN = '/html/body/div/div/div[4]/div[2]/div/div[1]/a[1]/a/p'
        @EGRESADES_BTN = "/html/body/div/div/div[4]/div[2]/div/div[1]/a[2]/a/p"
        @CURSOS_BTN = "/html/body/div/div/div[4]/div[2]/div/div[1]/a[3]/a/p"
        @EMPRESAS_BTN = "/html/body/div/div/div[4]/div[2]/div/div[1]/a[4]/a/p"
        @page = page
    end

    def clickOnEgresadeBtn()
        @page.find(:xpath,@EGRESADES_BTN).click
        return EgresadesPage.new(@page)
    end
    def validateWelocomeText()
        welcomeText = @page.find(:xpath,@WELCOME_TEXT).text
        if welcomeText  != "¡ Gracias por confiar en nosotres y ser parte del Proyecto Nahual !"
            raise "Expected the welcome message: '¡ Gracias por confiar en nosotres y ser parte del Proyecto Nahual '"
        end
    end

    def validateHomeBtn()
        buttonLabel = @page.find(:xpath,@HOME_BTN).text
        if buttonLabel  != "Home"
            raise "Expected the Home button at the left part of the page'"
        end
    end

    def validateEgresadesBtn()
        buttonLabel = @page.find(:xpath,@EGRESADES_BTN).text
        if buttonLabel  != "Egresades"
            raise "Expected the Egresades button at the left part of the page'"
        end
    end

    def validateCursosBtn()
        buttonLabel = @page.find(:xpath,@CURSOS_BTN).text
        if buttonLabel  != "Cursos"
            raise "Expected the Cursos button at the left part of the page'"
        end
    end

    def validateEmpresasBtn()
        buttonLabel = @page.find(:xpath,@EMPRESAS_BTN).text
        if buttonLabel  != "Empresas"
            raise "Expected the Empresas button at the left part of the page'"
        end
    end
end
