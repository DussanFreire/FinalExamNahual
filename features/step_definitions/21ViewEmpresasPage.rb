Before do
    @homePage = HomePage.new(page)
end

When('I click the button Empresas') do
    @empresasPage = @homePage.clickOnEmpresasBtn()
end

Then('I should see the title Lista Egresades on the top of the page') do
    @empresasPage.validateTitle()
end

Then('I should a button named Filtrar') do
    @empresasPage.validateFilterBtn()
end

Then('I should a button named Exportar') do
    @empresasPage.validateExportBtn()
end

Then('I should see a table of egresades with the following columns') do |table|
    @empresasPage.validateEgresadesTable(table)
end