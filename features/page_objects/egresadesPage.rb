class EgresadesPage

    def initialize(page)
        @LISTA_EGRESADES_TEXT = '/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[1]/h2/div'
        @SEARCH_FIELD = '#root > div > div.ui.container > div.app > div > div.pusher > div > div.tabla > div.tabla-menu > div.ui.search > div > input'
        @FILTER_BTN = "#root > div > div.ui.container > div.app > div > div.pusher > div > div.tabla > div.ui.button.floating.labeled.dropdown.icon > div.divider.text"
        @IMPORTAR_BTN = "#root > div > div.ui.container > div.app > div > div.pusher > div > div.tabla > div.tabla-menu > div.registrar > div > button"
        @TABLE_HEADER = "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/thead/tr/th"
        @page = page
    end

    def validateListaEgresade()
        text = @page.find(:xpath,@LISTA_EGRESADES_TEXT).text
        if text != 'Lista Egresades'
            raise 'Expected to see the title Lista Egresades'
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
            raise "Expected the Home button at the left part of the page'"
        end
    end

    def validateEgresadesBtn()
        buttonLabel = @page.find(:xpath,@EGRESADES_BTN).text
        if buttonLabel  != "Egresades"
            raise "Expected the Egresades button at the left part of the page'"
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
end
