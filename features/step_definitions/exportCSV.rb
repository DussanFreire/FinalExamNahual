require 'csv'
When('I click the button exportar') do
    sleep(5)
    find(:xpath,'/html/body/div/div/div[4]/div[2]/div/div[2]/div[3]/span/div/button').click
end

Then('I should export the csv with only one user') do
    # expect(CSV.parse(page.body).transpose).to eq([
    #     ["Nro.", 1],
    #     ["Nombre", "Sexto Grupo No Eliminar"],
    #     ["Correo", "juslan@gmail.com"],
    #     ["Teléfono", ""],
    #     ["Fecha de nacimiento", ""],
    #     ["Nivel de Inglés", "Basico"],
    #     ["Nodo", "Santa Fe"],
    #     ["Sede", "Máximo Paz"],
    #     ["Linkedin", ""],
    #     ["Curso", ""],
    #     ["Año de Egreso", "2019"]
    # ])
end

Given('I mark the egresade {string}') do |string|
    cuantityOfPages = page.all('div.ui.pagination.menu > a.item').count
    elementFound = ''
    for pag in 1..cuantityOfPages do
        sleep(3)
        cuantityOfRows = page.all('tbody > tr').count
        for index in 1..cuantityOfRows do
            dir = "/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr[#{index}]/td[2]"
            elementFound = find(:xpath, dir).text
            if elementFound === string
                find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div[2]/table/tbody/tr[#{index}]/td[1]/input").check
                break
            end
        end
        if elementFound === string
            break
        end
        find(:xpath, "/html/body/div/div/div[4]/div[2]/div/div[2]/div/div[2]/div[6]/a[4]").click
    end
    if elementFound != string
        raise 'Expected to have the user on the list of egresades.'
    end
end