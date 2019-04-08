if (!Admin.find_by(email: 'admin@admin.com'))
  Admin.create(email: 'admin@admin.com', password: '12345678')
end

if (!User.find_by(email: 'user@user.com'))
  FactoryBot.create(:user, name: 'user', email: 'user@user.com', password: '123456')
end

if (!City.find_by(name: 'São Paulo'))
  state = State.find_by(name: 'SP')
  if state.nil?
    state = FactoryBot.create(:state, name: 'SP')
  end
  FactoryBot.create(:city, name: 'São Paulo', state: state)
end

# empresas
if (!Company.find_by(name: 'Nintendo'))
  c = Company.new(name: 'Nintendo')
  c.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'nintendo.png')), filename: 'nintendo.png')
  c.save  
end

if (!Company.find_by(name: 'Sega'))
  c = Company.new(name: 'Sega')
  c.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'sega.png')), filename: 'sega.png')
  c.save  
end

if (!Company.find_by(name: 'Sony'))
  c = Company.new(name: 'Sony')
  c.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'sony.png')), filename: 'sony.png')
  c.save  
end

if (!Company.find_by(name: 'Microsoft'))
  c = Company.new(name: 'Microsoft')
  c.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'microsoft.png')), filename: 'microsoft.png')
  c.save  
end

# todo plataformas

# todo ganes