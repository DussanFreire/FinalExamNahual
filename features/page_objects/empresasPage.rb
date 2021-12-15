class EmpresasPage
    def initialize(page)
        @page= page
        @FILTER_BTN = '#root > div > div.ui.container > div.app > div > div.pusher > div.ui.segment > div > div.divider.text'
        @TITLE = '/html/body/div/div/div[4]/div[2]/div/div[2]/h2/div'
        @EXPORT_BTN = '#root > div > div.ui.container > div.app > div > div.pusher > div:nth-child(4) > div > button'
        @EGRESADES_TABLE = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table'
    end

    def validateFilterBtn()
        if not @page.has_css?(@FILTER_BTN,text: "Filtrar")
            raise 'Expected to see a filter button'
        end
    end

    def validateTitle()
        text = @page.find(:xpath,@TITLE).text
        if text != 'Lista Egresades'
            raise 'Expected to see the title Lista Egresades'
        end
    end

    def validateExportBtn()
        if not @page.has_css?(@EXPORT_BTN,text: "Exportar")
            raise 'Expected to see a Exportar button'
        end
    end

    def validateEgresadesTable(table)
        sleep(3)
        data = table.rows_hash
        data.each_pair do |key, value|
            case value    
                when "NOMBRE Y APELLIDO"
                    index = key.to_i + 1
                    data = @page.find(:xpath, "#{@EGRESADES_TABLE}/thead/tr/th[#{index}]").text
                    if data != value.upcase      
                        raise "Expected to see the complete name #{value} in the field NOMBRE Y APELLIDO"
                    end
                when "CORREO"
                    index = key.to_i + 1
                    data = @page.find(:xpath, "#{@EGRESADES_TABLE}/thead/tr/th[#{index}]").text
                    if data != value.upcase  
                        raise "Expected to see the date #{value} in the field CORREO"
                    end
                when "TELEFONO"
                    index = key.to_i + 1
                    data = @page.find(:xpath, "#{@EGRESADES_TABLE}/thead/tr/th[#{index}]").text
                    if data != value.upcase      
                        raise "Expected to see the email #{value} in the field TELEFONO"
                    end
                when "NODO"
                    index = key.to_i + 1
                    data = @page.find(:xpath, "#{@EGRESADES_TABLE}/thead/tr/th[#{index}]").text
                    if data != value.upcase      
                        raise "Expected to see the phone number #{value} in the field NODO"
                    end
                when "MÓDULOS CURSADOS"
                    index = key.to_i + 1
                    data = @page.find(:xpath, "#{@EGRESADES_TABLE}/thead/tr/th[#{index}]").text
                    if data != value.upcase      
                        raise "Expected to see the SEDE #{value} in the field MÓDULOS CURSADOS" 
                    end

                when "NIVEL DE INGLES"
                    index = key.to_i + 1
                    data = @page.find(:xpath, "#{@EGRESADES_TABLE}/thead/tr/th[#{index}]").text
                    if data != value.upcase      
                        raise "Expected to see the SEDE #{value} in the field NIVEL DE INGLES" 
                    end
            end
        end
    end  
end