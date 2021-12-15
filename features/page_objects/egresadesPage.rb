class EgresadesPage

    def initialize(page)
        @LISTA_EGRESADES_TEXT = '/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[1]/h2/div'
        @SEARCH_FIELD = '#root > div > div.ui.container > div.app > div > div.pusher > div > div.tabla > div.tabla-menu > div.ui.search > div > input'
        @FILTER_BTN = "#root > div > div.ui.container > div.app > div > div.pusher > div > div.tabla > div.ui.button.floating.labeled.dropdown.icon > div.divider.text"
        @IMPORTAR_BTN = "#root > div > div.ui.container > div.app > div > div.pusher > div > div.tabla > div.tabla-menu > div.registrar > div > button"
        @TABLE_HEADER = "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/thead/tr/th"
        @NAME_LABEL= 'div.ui.label.nombre'
        @BTN_FROM_ROW = './td[5]/a[1]/button'
        @ROW_FROM_LABEL = './parent::td/parent::tr'
        @PAGINATOR = 'div.ui.pagination.menu > a.item'
        @TABLE_ROWS = 'tbody > tr'
        @TABLE_BODY = '/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/tbody'
        @NEXT_PAGE_BTN = "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[6]/a[4]"
        @SUCCESS_IMPORT_MSG = '/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[3]/div/div/div'
        @SUCCESS_IMPORT_MSG_CNT = '/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[3]/div/div/p'       
        @page = page
        #Edition form
        @NAME_FIELD_FORM = 'nombre'
        @LAST_NAME_FORM = "Apellido"
        @DOCUMENT_TYPE_FORM ='tipoDNI'
        @DOCUMENT_FORM = 'dni'
        @CONFIRM_BTN_FORM = 'Confirmar'
        #Egresade details modal
        @COMPLETE_NAME_MODAL ='/html/body/div[2]/div/div[1]/div/div[2]/h1'
        @DOCUMENT_TYPE_FORM_MODAL = '/html/body/div[2]/div/div[2]/div/div[1]/div[2]/div/div/div/div/form/div[4]/div'
        @DOCUMENT_MODAL = '/html/body/div[2]/div/div[2]/div/div[1]/div[2]/div/div/div/div/form/div[3]/div'
        @CLOSE_BTN_MODAL = 'Cerrar'
        # import form
        @CHARGE_CSV_FIELD = '/html/body/div[2]/div/div[2]/div[2]/input'
        @CONFIRM_IMPORT_BTN = '/html/body/div[2]/div/div[4]/button[2]'
        @WANING_MSG = '/html/body/div[2]/div/div[2]/div[1]/div/div/div'
        @WARNING_MSG_CONTENT = '/html/body/div[2]/div/div[2]/div[1]/div/div/p'
        @STATUS_MSG = '/html/body/div[2]/div/div[4]/h1'
        @CSV_NAME = '/html/body/div[2]/div/div[2]/div[2]/div/div/div[2]/span[2]'
        @CSV_TABLE_COLUMN_PREVIEW = '/html/body/div[2]/div/div[4]/table/tbody/tr/td'
    end

    def clickOnTheImportBtn()
        @page.find(:css, @IMPORTAR_BTN).click
    end

    def chargeCSV(string)
        @userAdded = string
        Capybara.ignore_hidden_elements = false
        sleep(4)
        el =  @page.find(:xpath, @CHARGE_CSV_FIELD)
        el.attach_file('path\OneEgresade.csv')
    end

    def chargeWrongCSV()
        Capybara.ignore_hidden_elements = false
        sleep(4)
        el =  @page.find(:xpath, '/html/body/div[2]/div/div[2]/div[2]/input')
        el.attach_file('path\OneEgresadeWrongNodoAndSede.csv')
    end

    def clickConfirmarImportBtn()
        @page.find(:xpath, @CONFIRM_IMPORT_BTN).click
    end
    def clickInTheEditButtonOfAnEgresade(string)
        td = @page.find(:css, @NAME_LABEL , text: /#{string}/)
        tr = td.find(:xpath, @ROW_FROM_LABEL) 
        tr.find(:xpath, @BTN_FROM_ROW).click
    end

    def editFieldsOfFormsOfEdition(table)
        sleep(3) 
        data = table.rows_hash
        rowCounter = 0
        data.each_pair do |key, value|
            if value.to_i >0
                rowCounter +=1
            end 
            case key
                when "Nombre"
                    @page.fill_in @NAME_FIELD_FORM, :with => value
                    @nombreCompleto = value
                    @nombre = value
                when "Apellido"
                    @page.fill_in @LAST_NAME_FORM , :with => value
                    @nombreCompleto += ' '+value
                    @apellido = value
                when "Tipo Documentacion"
                    @page.fill_in @DOCUMENT_TYPE_FORM, :with => value
                    @tipoDNI=value 
                when "Documentacion"
                    @page.fill_in @DOCUMENT_FORM, :with => value
                    @docu=value
            end	
        end
    end

    def findEgresadeOnTheList()
        cuantityOfPages = @page.all(@PAGINATOR).count
        elementFound = ''
        for pag in 1..cuantityOfPages do
            sleep(3)
            cuantityOfRows = @page.all(@TABLE_ROWS).count
            for index in 1..cuantityOfRows do
            dir = "#{@TABLE_BODY}/tr[#{index}]/td[1]/div[1]"
            elementFound = @page.find(:xpath, dir).text
                if elementFound === @userAdded
                    break
                end
            end
            if elementFound === @userAdded
                break
            end
            @page.find(:xpath,  @NEXT_PAGE_BTN).click
        end
        if @userAdded != elementFound
            raise 'Expected the user just added to be in the egresades list.'
        end
    end

    def clickOnVerEgresadeBtn(egresadeName=@nombreCompleto)
        td = @page.find(:css, 'div.ui.label.nombre', text: /#{egresadeName}/)
        tr = td.find(:xpath, './parent::td/parent::tr') 
        tr.find(:xpath,'./td[5]/button[1]').click
    end

    def clickOnConfirmBTN()
        @page.click_on(@CONFIRM_BTN_FORM)
        sleep(1)
    end

    def clickOnTheCertificateOfAnEgresade(egresadesName)
        @user = egresadesName
        cuantityOfPages = @page.all(@PAGINATOR).count
        elementFound = ''
        for pag in 1..cuantityOfPages do
            sleep(3)
            cuantityOfRows = @page.all(@TABLE_ROWS).count
            for index in 1..cuantityOfRows do
                dir = "#{@TABLE_BODY}/tr[#{index}]/td[1]/div[1]"
                elementFound = @page.find(:xpath, dir).text
                if elementFound === egresadesName
                @nodo = @page.find(:xpath, "#{@TABLE_BODY}/tr[#{index}]/td[2]/div").text
                @page.find(:xpath, "#{@TABLE_BODY}/tr[#{index}]/td[5]/a[2]/button").click
                return CertificatePage.new(@page,egresadesName,@nodo)
                break
                end
            end
            if elementFound === egresadesName
                break
            end
            @page.find(:xpath, @NEXT_PAGE_BTN).click
        end
        if elementFound != egresadesName
            raise 'Expected to have the user on the list of egresades.'
        end
    end

    # VALIDATIONS
    def validateWarningMessage()
        warningTitle =  @page.find(:xpath, @WANING_MSG ).text
        if warningTitle != 'Error de carga!'
            raise 'Expected to see a warning message with the title Error de carga!'
        end
    end

    def validateWaningMessageContent()
        warningMessage =  @page.find(:xpath, @WARNING_MSG_CONTENT).text
        if warningMessage != 'Error de formato en la columna Nodos o Sedes, verifique la informacion..'
            raise 'Expected to see the following content of the error Error de formato en la columna Nodos o Sedes, verifique la informacion..'
        end
    end

    def validateNotFilledStatus()
        status =  @page.find(:xpath,@STATUS_MSG ).text
        if status != 'No se cargo ningun archivo'
            raise 'Expected to see in the bottom part of the page the text No se cargo ningun archivo'
        end
    end

    def validateCSVNameOnceCharged()
        fileName = @page.find(:xpath, @CSV_NAME).text
        if fileName != 'OneEgresade.csv'
            raise 'Expexted the input of the csv file filled with the csv'
        end
    end

    def validatePreviewContentOfImport(table)
        sleep(3)
        data = table.rows_hash
        data.each_pair do |key, value|
            case key
                when "Nombre y Apellido"
                    data = @page.find(:xpath, "#{@CSV_TABLE_COLUMN_PREVIEW}[1]").text
                    if data != value
                        raise "Expected to see the complete name #{value} in the field Nombre y apellido"
                    end
                when "Fecha de Nacimiento"
                    data = @page.find(:xpath, "#{@CSV_TABLE_COLUMN_PREVIEW}[2]").text
                    if data != value
                        raise "Expected to see the date #{value} in the field Fecha de Nacimiento"
                    end
                when "Mail"
                    data = @page.find(:xpath, "#{@CSV_TABLE_COLUMN_PREVIEW}[3]").text
                    if data != value
                        raise "Expected to see the email #{value} in the field Mail"
                    end
                when "Numero de Celular"
                    data = @page.find(:xpath, "#{@CSV_TABLE_COLUMN_PREVIEW}[4]").text
                    if data != value
                        raise "Expected to see the phone number #{value} in the field Numero de Celular"
                    end
                when "SEDE"
                    data = @page.find(:xpath, "#{@CSV_TABLE_COLUMN_PREVIEW}[5]").text
                    puts data
                    if data != value
                        raise "Expected to see the SEDE #{value} in the field SEDE" 
                    end
                when "NODO"
                    data = @page.find(:xpath, "#{@CSV_TABLE_COLUMN_PREVIEW}[6]").text
                    puts data
                    if data != value
                        raise "Expected to see the NODO #{value} in the field NODO"
                    end
            end
        end
    end

    def validateEmptyTable()
        @TABLE_ROWS
        cuantityOfRows = @page.all(@TABLE_ROWS).count
        if cuantityOfRows > 0
            raise 'Expected to see an empty table'
        end
    end

    def validateSuccessMessage() 
        message = @page.find(:xpath, @SUCCESS_IMPORT_MSG).text
        if message != "Registro exitoso!"
            raise "Expected the success mesage Registro exitoso" 
        end
    end


    def validateSuccessMessageContent() 
        message = @page.find(:xpath,@SUCCESS_IMPORT_MSG_CNT).text
        if message!= "Se realizo el registro de 1 egresados exitosamente."
            raise "Expected the success mesage Se realizo el registro de 1 egresados exitosamente." 
        end
    end

    def validateThatTheDataHasChanged()
        sleep(1) 
        nameComplete = @page.find(:xpath, @COMPLETE_NAME_MODAL).text
        if nameComplete != @nombreCompleto
            raise "Nombre y Apellido in Card does not match with expected"
        end
        documentationType = @page.find(:xpath, @DOCUMENT_TYPE_FORM_MODAL).text
        if documentationType != @tipoDNI
            raise "Tipo Documentacion in Card does not match with expected"
        end
        doc = @page.find(:xpath, @DOCUMENT_MODAL).text
        if doc != @docu
            raise "Documentacion in Card does not match with expected"
        end
        @page.click_on(@CLOSE_BTN_MODAL )
    end

    def validateDataOfTheModal(name)
        title = @page.find(:xpath,@COMPLETE_NAME_MODAL).text
        if title  != name
            raise "Expected to see the user data"
        end
    end

    def validateListaEgresade(listName='Lista Egresades')
        text = @page.find(:xpath,@LISTA_EGRESADES_TEXT).text
        if text != listName
            raise 'Expected to see the title Lista Egresades'
        end
    end

    def validateEgresadesTable(table)
        data = table.rows_hash
        data.each_pair do |key, value|
            case value    
                when "Nombre y Apellido"
                    data = @page.find(:xpath, "#{@TABLE_HEADER}[#{key}]").text
                    puts data
                    if data != value.upcase      
                        raise "Expected to see the complete name #{value} in the field Nombre y apellido"
                    end
                when "NODO"
                    data = @page.find(:xpath, "#{@TABLE_HEADER}[#{key}]").text
                    if data != value.upcase  
                        raise "Expected to see the date #{value} in the field NODO"
                    end
                when "SEDE"
                    data = @page.find(:xpath, "#{@TABLE_HEADER}[#{key}]").text
                    if data != value.upcase      
                        raise "Expected to see the email #{value} in the field SEDE"
                    end
                when "ESTADO"
                    data = @page.find(:xpath, "#{@TABLE_HEADER}[#{key}]").text
                    if data != value.upcase      
                        raise "Expected to see the phone number #{value} in the field ESTADO"
                    end
                when "ACCIÓN"
                    data = @page.find(:xpath, "#{@TABLE_HEADER}[#{key}]").text
                    if data != value.upcase      
                        raise "Expected to see the SEDE #{value} in the field ACCIÓN" 
                    end
            end
        end
    end
    

    def validateSearchField()
        if not @page.has_css?(@SEARCH_FIELD)
            raise 'Expected to see a search field'
        end
    end


    def validateFilterField()
        if not @page.has_css?(@FILTER_BTN,text: "Egresade")
            raise 'Expected to see a filter button'
        end
    end

    def validateImportBtn
        if not @page.has_css?(@IMPORTAR_BTN,text: "Importar")
            raise 'Expected to see a button named Importar'
        end
    end
    def validateHomeBtn()
        buttonLabel = @page.find(:xpath,@HOME_BTN).text
        if buttonLabel  != "Home"
            raise "Expected the Home button at the left part of the @page'"
        end
    end

    def validateEgresadesBtn()
        buttonLabel = @page.find(:xpath,@EGRESADES_BTN).text
        if buttonLabel  != "Egresades"
            raise "Expected the Egresades button at the left part of the @page'"
        end
    end

    
end
