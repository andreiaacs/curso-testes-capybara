describe 'Upload', :upload do

    before(:each) do
        visit  'https://training-wheels-protocol.herokuapp.com/upload'
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem =  Dir.pwd + '/spec/fixtures/Baymax.png'
    end

    it 'upload com arquivo texto' do
        attach_file('file-upload', @arquivo)
        click_button 'Upload'

        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'arquivo.txt'
    end

    it 'upload com imagem', :upload_imagem do
        attach_file('file-upload', @imagem)
        click_button 'Upload'

        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'Baymax.png'

        img = find('#new-image')
        expect(img[:src]).to include '/uploads/Baymax.png'
    end

    after(:each) do
        sleep 5
    end

end