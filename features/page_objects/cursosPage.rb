class CursosPage
    def initialize(page)
        @page= page
        @FIRST_ROW_DELETE_BTN = "/html/body/div/div/div[4]/div[2]/div/div[2]/table/tbody/tr[1]/td[7]/div/button[2]"
        @COFIRM_BTN_MODAL = "/html/body/div[2]/div/div[3]/div/button[2]"
        @CONFIRMATION_MESSAGE ="/html/body/div/div/div[2]/div/div/div/p"
        @ACTIVATE_STATE_BTN =   "/html/body/div/div/div[4]/div[2]/div/div[2]/div[4]/div/div[2]"
        @INACTIVATE_STATE_BTN = "/html/body/div/div/div[4]/div[2]/div/div[2]/div[4]/div/div[2]/div[2]/div[2]"
        @STATE = "/html/body/div/div/div[4]/div[2]/div/div[2]/div[4]/div/div[2]/div[1]"

        @NEW_CLASS_BTN = "/html/body/div/div/div[4]/div[2]/div/div[2]/div[4]/button"
        @PERIOD_1_BTN = "/html/body/div[2]/div/div[2]/form/div[2]/div/input"
        @TOPIC_BTN = "/html/body/div[2]/div/div[2]/form/div[5]/div"
        @FIRST_TOPIC_BTN = "/html/body/div[2]/div/div[2]/form/div[5]/div/div[2]/div[1]"
        @SEDE_NODE_OPT_BTN = "/html/body/div[2]/div/div[2]/form/div[6]/div"
        @FIRST_SEDE_NODO_BTN = "/html/body/div[2]/div/div[2]/form/div[6]/div/div[2]/div[1]"
        @SCHEDULE_INPUT = "/html/body/div[2]/div/div[2]/form/div[7]/div/input"
        @PROFESOR_INPUT = "/html/body/div[2]/div/div[2]/form/div[8]/div/input"
        @WRITE_NOTAS_TEXT_AREA = "/html/body/div[2]/div/div[2]/form/div[9]/textarea"
        @CONFIRM_BTN = "/html/body/div[2]/div/div[3]/button[2]"

        @CORRECT_CLASS_CREATION_MESSAGE = "/html/body/div/div/div[2]/div/div/div"
    end

    def clickOnTheFirstRowDeleteBtn()
        @page.find(:xpath,@FIRST_ROW_DELETE_BTN ).click
    end

    def clickOnTheConfirmBtn()
        @page.find(:xpath,@COFIRM_BTN_MODAL ).click
    end

    def clickActivateStateBtn()
        @page.find(:xpath,@ACTIVATE_STATE_BTN ).click
    end

    def clickInactivateStateBtn()
        @page.find(:xpath,@INACTIVATE_STATE_BTN ).click
    end

    def clickNewClassBtn()
        @page.find(:xpath,@NEW_CLASS_BTN ).click
    end

    def enterThePeriodOne()
        @page.find(:xpath,@PERIOD_1_BTN).set "1"
    end

    def clickTopicBtn()
        @page.find(:xpath,@TOPIC_BTN ).click
    end

    def selectFirstTopic()
        @page.find(:xpath,@FIRST_TOPIC_BTN).click
    end

    def clickSedeNodoOpt()
        @page.find(:xpath,@SEDE_NODE_OPT_BTN ).click
    end

    def clickFirstSedeNodo()
        @page.find(:xpath,@FIRST_SEDE_NODO_BTN ).click
    end

    def chooseSchedule(string)
        @page.find(:xpath, @SCHEDULE_INPUT).set string
    end

    def enterTheProfesor(string)
        @page.find(:xpath, @PROFESOR_INPUT).set string
    end

    def writeNotas(string)
        @page.find(:xpath, @WRITE_NOTAS_TEXT_AREA).set string
    end

    def clickConfirmBtn()
        @page.find(:xpath,@CONFIRM_BTN ).click
    end
    #Validations
    def validateConfirmationMessage()
        messageLabel = @page.find(:xpath, @CONFIRMATION_MESSAGE).text
        if messageLabel  != 'Curso eliminado con éxito'
            raise "Expected message of confirmation"
        end
    end

    def validateInactiveListAndState()
        state = @page.find(:xpath,@STATE).text
        if state != 'Inactivo'
            raise "Expected Inactivo state"
        end
    end

    def validateCorrectClassCreationMessage()
        messageLabel = @page.find(:xpath,@CORRECT_CLASS_CREATION_MESSAGE).text
        if messageLabel != 'Curso creado con éxito'
            raise "Expected confirmation of creation"
        end
    end

end
