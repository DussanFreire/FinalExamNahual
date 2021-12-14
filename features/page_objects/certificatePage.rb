class CertificatePage

    def initialize(page, name, nodo)
        @CERTIFICATE_NAME = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/h1'
        @CERTIFICATE_NODO = '/html/body/div/div/div[4]/div[2]/div/div[2]/div[1]/div/h2'
        @NAME = name
        @NODO = nodo
        @page = page
    end

    def validateCertificateName()
        certificateName = @page.find(:xpath,@CERTIFICATE_NAME).text
        if certificateName != @NAME
            raise "Expected the #{@NAME} name on the certificate"
        end
    end

    def validateCertificateNodo()
        certificateNodo = @page.find(:xpath,@CERTIFICATE_NODO).text
        if certificateNodo != @NODO[2..].upcase
            raise "Expected the #{@NODO[2..].upcase} nodo name on the certificate"
        end
    end
end