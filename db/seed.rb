andy = User.create(username: "andy", password: "test", email: "andy@test.com", name: "Andy", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
tadej = User.create(username: "tadej", password: "test", email: "tadej@test.com", name: "Tadej", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
remco = User.create(username: "remco", password: "test", email: "remco@test.com", name: "Remco", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
peter = User.create(username: "peter", password: "test", email: "peter@test.com", name: "Peter", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")


andys_bike = Bike.create(user_id: 1, model: "Specialized Diverge")
tadejs_bike = Bike.create(user_id: 2, model: "Colnago Prototipo")
remcos_bike = Bike.create(user_id: 3, model: "S-Works Tarmac SL7")
peters_bike = Bike.create(user_id: 4, model: "S-Works Tarmac SL7")
andys_bike_2 = Bike.create(user_id: 1, model: "Specialized Tarmac SL7")

Bike.all[0].components << Component.create(category: 'Groupset', model: 'Shimano 105 Mechanical')
Bike.all[0].components << Component.create(category: 'Wheelset', model: 'Axis Elite 4.0')
Bike.all[0].save


Bike.all[1].components << Component.create(category: 'Groupset', model: 'Campagnolo Super Record')
Bike.all[1].components << Component.create(category: 'Wheelset', model: 'Campagnolo Bora WTO 45mm')
Bike.all[1].save

Bike.all[2].components << Component.create(category: 'Groupset', model: 'Shimano Dura-Ace Di2')
Bike.all[2].components << Component.create(category: 'Wheelset', model: 'Roval Alpinist 35mm')
Bike.all[2].save


Bike.all[3].components << Component.create(category: 'Groupset', model: 'Shimano Dura-Ace Di2')
Bike.all[3].components << Component.create(category: 'Wheelset', model: 'Roval Alpinist 35mm')
Bike.all[3].save

Bike.all[4].components << Component.create(category: 'Groupset', model: 'Shimano Ultegra Di2')
Bike.all[4].components << Component.create(category: 'Wheelset', model: 'DT Swiss ARC 1400 65mm')
Bike.all[4].save
