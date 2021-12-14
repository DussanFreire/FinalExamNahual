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

    def clickOnVerEgresadeBtn(egresadeName=@nombreCompleto)
        td = @page.find(:css, 'div.ui.label.nombre', text: /#{egresadeName}/)
        tr = td.find(:xpath, './parent::td/parent::tr') 
        tr.find(:xpath,'./td[5]/button[1]').click
    end

    def clickOnConfirmBTN()
        @page.click_on(@CONFIRM_BTN_FORM)
        sleep(1)
    end
    # VALIDATIONS
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
