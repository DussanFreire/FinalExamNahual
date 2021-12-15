Before do
  @egresadesPage = EgresadesPage.new(page)
end


Given('I am in the egresades page') do
end

When('I fill the search field with {string}') do |string|
  sleep(3)
  @egresadesPage.fillSearchField(string)
end

Then('I should see in the first row the user {string}') do |string|
  @egresadesPage.validateUserInTheFirstRow(string)
end