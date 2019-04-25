require 'space'
require 'user'
require 'categoria'
require 'database_helpers'
describe Space do

before(:each)do
    @categoria = Categoria.create(description: "Holiday")
    @user = User.create(name: 'cristopher', email: 'test@example.com', password: 'password123', telefono: '84798537', host: 'f' )
    @space = Space.create(name: 'San Juan', description: 'Cuartos familiares', pricexnight: '120', location: 'Managua', id_categories: @categoria.id, id_user: @user.id)
end
  describe '.create' do
    it 'Creating a new space' do
      expect(@space).to be_a Space
      expect(@space.name).to eq 'San Juan'
      expect(@space.description).to eq 'Cuartos familiares'
      expect(@space.pricexnight).to eq 'C$ 120.00'
      expect(@space.location).to eq 'Managua'
      expect(@space.id_categories).to eq @categoria.id
      expect(@space.id_user).to eq @user.id
    end
  end

  describe '.find' do
    it 'find a space' do
      @space = Space.find(id: @space.id)
      @user = User.find(id: @user.id)
      @categoria = Categoria.find(id: @categoria.id)
      expect(@space.id).to eq @space.id
      expect(@space.name).to eq @space.name
      expect(@space.description).to eq @space.description
      expect(@space.pricexnight).to eq @space.pricexnight
      expect(@space.location).to eq @space.location
      expect(@space.id_categories).to eq @categoria.id
      expect(@space.id_user).to eq @user.id
    end
    it "returns nil if there is no ID given" do
      expect(Space.find(id: nil)).to eq nil
    end
  end

  describe '.all' do
    it 'all the space' do
      @space = Space.all(id: @space.id)
      @user = User.all(id: @user.id)
      @categoria = Categoria(id: @categoria.id)
      
      expect(@space.first).to be_a Space
      expect(@space.first.id).to eq @space.id
      expect(@space.first.name).to eq @space.name
      expect(@space.first.description).to eq @space.description
      expect(@space.first.pricexnight).to eq @space.pricexnight
      expect(@space.first.location).to eq @space.location
      expect(@space.first.id_categories).to eq @categoria.id
      expect(@space.first.id_user).to eq @user.id

    end
  end
end
