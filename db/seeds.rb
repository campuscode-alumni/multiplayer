if (!Admin.find_by(email: 'admin@admin.com'))
  Admin.create(email: 'admin@admin.com', password: '12345678')
end

if !User.find_by(email: 'user@user.com')
  User.create(name: 'user', email: 'user@user.com', password: '123456', nickname: 'fire-user')
end
if !User.find_by(email: 'user2@user.com')
  User.create(name: 'user 2', email: 'user2@user.com', password: '123456', nickname: 'air-user')
end
if !User.find_by(email: 'user3@user.com')
  User.create(name: 'user 3', email: 'user3@user.com', password: '123456', nickname: 'water-user')
end
if !User.find_by(email: 'user4@user.com')
  User.create(name: 'user 4', email: 'user4@user.com', password: '123456', nickname: 'soil-user')
end

if (!City.find_by(name: 'São Paulo'))
  state = State.find_by(name: 'SP')
  if state.nil?
    state = State.create(name: 'SP')
  end
  City.create(name: 'São Paulo', state: state)
end

# empresas

nintendo = Company.find_by(name: 'Nintendo')
if nintendo.nil?
  nintendo = Company.new(name: 'Nintendo')
  nintendo.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'nintendo.png')), filename: 'nintendo.png')
  nintendo.save
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

snes = Platform.find_by(name: 'Super Nintendo')
if snes.nil?
  snes = Platform.new(name: 'Super Nintendo', company: nintendo)
  snes.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'snes.png')), filename: 'snes.png')
  snes.save
end

megadrive = Platform.find_by(name: 'Mega Drive')
if megadrive.nil?
  megadrive = Platform.new(name: 'Mega Drive', company: Company.find_by(name: 'Sega'))
  megadrive.logo.attach(io: File.open(Rails.root.join('spec', 'support', 'megadrive.png')), filename: 'megadrive.png')
  megadrive.save
end

if (!Platform.find_by(name: 'Nintendo Switch'))
  p = Platform.new(name: 'Nintendo Switch', company: nintendo)
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

categories = ['RPG', 'FPS', 'Plataforma', 'Esporte', 'Aventura', 'Ação', 'Beat \'em Up', 'Dungeon Crawl']
categories.each { |c| create_category(c) }

# todo games

if !Game.find_by(name: 'Super Mario Kart')
  game = Game.new(name: 'Super Mario Kart', release_year: 1992)
  game.photo.attach(io: File.open(Rails.root.join('spec', 'support', 'mariokart.jpg')), filename: 'mariokart.jpg')
  game.save
  GamePlatform.create(game: game, platform: snes)
  CategoryGame.create(category: Category.find_by(name: 'Esporte'), game: game)
end

if !Game.find_by(name: 'Super Bomberman')
  game = Game.new(name: 'Super Bomberman', release_year: 1993)
  game.photo.attach(io: File.open(Rails.root.join('spec', 'support', 'bomberman.jpg')), filename: 'bomberman.jpg')
  game.save
  GamePlatform.create(game: game, platform: snes)
  CategoryGame.create(category: Category.find_by(name: 'Ação'), game: game)
  CategoryGame.create(category: Category.find_by(name: 'Aventura'), game: game)
end

if !Game.find_by(name: 'Mega Man X')
  game = Game.new(name: 'Mega Man X', release_year: 1994)
  game.photo.attach(io: File.open(Rails.root.join('spec', 'support', 'megamanx.jpg')), filename: 'megamanx.jpg')
  game.save
  GamePlatform.create(game: game, platform: snes)
  CategoryGame.create(category: Category.find_by(name: 'Ação'), game: game)
  CategoryGame.create(category: Category.find_by(name: 'Plataforma'), game: game)
end

if !Game.find_by(name: 'Streets of Rage')
  game = Game.new(name: 'Streets of Rage', release_year: 1991)
  game.photo.attach(io: File.open(Rails.root.join('spec', 'support', 'streetsofrage.jpg')), filename: 'streetsofrage.jpg')
  game.save
  GamePlatform.create(game: game, platform: megadrive)
  CategoryGame.create(category: Category.find_by(name: 'Beat \'em Up'), game: game)
end

if !Game.find_by(name: 'Sonic the Hedgehog')
  game = Game.new(name: 'Sonic the Hedgehog', release_year: 1991)
  game.photo.attach(io: File.open(Rails.root.join('spec', 'support', 'sonic.jpg')), filename: 'sonic.jpg')
  game.save
  GamePlatform.create(game: game, platform: megadrive)
  CategoryGame.create(category: Category.find_by(name: 'Plataforma'), game: game)
end

if !Game.find_by(name: 'Dark Souls')
  game = Game.new(name: 'Dark Souls', release_year: 2011)
  game.photo.attach(io: File.open(Rails.root.join('spec', 'support', 'darksouls.jpg')), filename: 'darksouls.jpg')
  game.save
  GamePlatform.create(game: game, platform: Platform.find_by(name: 'Playstation 4'))
  GamePlatform.create(game: game, platform: Platform.find_by(name: 'X Box One'))
  GamePlatform.create(game: game, platform: Platform.find_by(name: 'Nintendo Switch'))
  CategoryGame.create(category: Category.find_by(name: 'Ação'), game: game)
  CategoryGame.create(category: Category.find_by(name: 'RPG'), game: game)
  CategoryGame.create(category: Category.find_by(name: 'Dungeon Crawl'), game: game)
end

