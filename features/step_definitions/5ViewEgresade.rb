Before do
    @egresadesPage = EgresadesPage.new(page)
end
When('I click the button Ver of the user named {string}') do |string|
    @egresadesPage.clickOnVerEgresadeBtn(string)
end

Then('I should see the name {string}') do |string|
    @egresadesPage.validateDataOfTheModal(string)
end