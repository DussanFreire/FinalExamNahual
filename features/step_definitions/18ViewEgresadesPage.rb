Before do
    @egresadesPage = EgresadesPage.new(page)
end

Given('I am on the home page') do
end

Then('I should see the title Lista Egresades') do
    @egresadesPage.validateListaEgresade()
end

Then('I should see a search field') do
    @egresadesPage.validateSearchField()
end

Then('I should see a filter button') do
    @egresadesPage.validateFilterField()
end

Then('I should a button named Importar') do
    @egresadesPage.validateImportBtn()
end

Then('I should see a table with the following columns') do |table|
    @egresadesPage.validateEgresadesTable(table)
end