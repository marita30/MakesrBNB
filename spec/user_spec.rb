require 'user'
require 'database_helpers'


describe User do

  before(:each) do
    @user = User.create(name: 'cristopher', email: 'test@example.com', password: 'password123', telefono: '84798537', host: 'f' )
  end

  describe '.create' do
    it 'creating a new user' do
      persisted_data = persisted_data(id: @user.id, table: 'usuario')
      expect(@user).to be_a User
      expect(@user.id).to eq persisted_data.first['id_user']
      expect(@user.name).to eq 'cristopher'
      expect(@user.email).to eq 'test@example.com'
      expect(@user.telefono).to eq '84798537'
      expect(@user.host).to eq 'f'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(name: 'cristopher', email: 'test@example.com', password: 'password123', telefono: '84798537', host: 'f')
    end
  end

  describe '.find' do
    it 'return the user' do
      @user = User.find(id: @user.id)
      expect(@user.id).to eq @user.id
      expect(@user.name).to eq @user.name
      expect(@user.email).to eq @user.email
      expect(@user.telefono).to eq @user.telefono
      expect(@user.host).to eq @user.host
    end

    it 'returns nil if there is no ID given' do
     expect(User.find(id: nil)).to eq nil
   end
  end
end
