describe  'forms' do
    it 'login com sucesso' do
        visit "https://training-wheels-protocol.herokuapp.com/login"
        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis!'
        click_button 'Login'

        expect(find('#flash').visible?).to be true
        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'senha incorreta' do
        visit "https://training-wheels-protocol.herokuapp.com/login"
        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis'
        click_button 'Login'

        expect(find('#flash').visible?).to be true
        expect(find('#flash').text).to include 'Senha é invalida!'        
    end

    it 'usuário não cadastrado' do
        visit "https://training-wheels-protocol.herokuapp.com/login"
        fill_in 'username', with: 'andreia'
        fill_in 'password', with: 'jarvis!'
        click_button 'Login'

        expect(find('#flash').visible?).to be true
        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!' 
    end 
end