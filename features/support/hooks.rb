After '@egresadeRestoreData' do 
        td = page.find(:css, 'div.ui.label.nombre', text: /#{'Jager Vargas Rejas'}/)
        tr = td.find(:xpath, './parent::td/parent::tr') 
        tr.find(:xpath,'./td[5]/a[1]/button').click
        sleep(3) 
        fill_in 'nombre', :with => "Sexto Grupo"
        fill_in 'apellido', :with => "No Eliminar"
        fill_in 'tipoDNI', :with => "DNI"	 
        fill_in 'dni', :with => "1111111"
        click_on('Confirmar')
        sleep(3)
end



