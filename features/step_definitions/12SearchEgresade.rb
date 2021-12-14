Given('I am in the egresades page') do
end

When('I fill the search field with {string}') do |string|
  sleep(3)
  find(:xpath, '/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[4]/div[1]/div/input').fill_in with: string
end

Then('I should see in the first row the user {string}') do |string|
  sleep(3)
  name = find(:xpath, '/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/table/tbody/tr/td[1]/div[1]').text
  if name != string
      raise "Expected to find the #{string} in the first row'"
  end
end