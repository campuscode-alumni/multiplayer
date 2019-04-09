if (!Admin.find_by(email: 'admin@admin.com'))
  Admin.create(email: 'admin@admin.com', password: '12345678')
end

if (!User.find_by(email: 'user@user.com'))
  User.create(name: 'user', email: 'user@user.com', password: '123456')
end

if (!City.find_by(name: 'São Paulo'))
  state = State.find_by(name: 'SP')
  if state.nil?
    state = State.create(name: 'SP')
  end
  City.create(name: 'São Paulo', state: state)
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

# plataformas

if (!Platform.find_by(name: 'Super Nintendo'))
  p = Platform.new(name: 'Super Nintendo', company: Company.find_by(name: 'Nintendo'))
  p.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'snes.png')), filename: 'snes.png')
  p.save
end

if (!Platform.find_by(name: 'Mega Drive'))
  p = Platform.new(name: 'Mega Drive', company: Company.find_by(name: 'Sega'))
  p.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'megadrive.png')), filename: 'megadrive.png')
  p.save
end

if (!Platform.find_by(name: 'Nintendo Switch'))
  p = Platform.new(name: 'Nintendo Switch', company: Company.find_by(name: 'Nintendo'))
  p.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'switch.png')), filename: 'switch.png')
  p.save
end

if (!Platform.find_by(name: 'Playstation 4'))
  p = Platform.new(name: 'Playstation 4', company: Company.find_by(name: 'Sony'))
  p.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'ps4.png')), filename: 'ps4.png')
  p.save
end

if (!Platform.find_by(name: 'X Box One'))
  p = Platform.new(name: 'X Box One', company: Company.find_by(name: 'Microsoft'))
  p.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'xone.png')), filename: 'xone.png')
  p.save
end

# categorias

def create_category(name)
  if !Category.find_by(name: name)
    Category.create(name: name)
  end
end

categories = ['RPG', 'FPS', 'Plataforma', 'Esporte', 'Aventura']
categories.each { |c| create_category(c) }

# todo games

