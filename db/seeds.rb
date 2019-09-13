rennes = City.find_by(name: "Rennes")
if rennes == nil
	rennes = City.create!(name: "Rennes")
end

name = "Loco Loca"
if rennes.places.find_by(name:name) == nil
	address = "17 Rue Comté de Lanjuinais, 35000 Rennes"
	description = "Espace contemporain stylé autour de la culture latine avec coffee-shop, bar à tapas, jardin et restaurant."
	wifi_identification = "LOCO LOCA"
	rennes.places.create!(name:name, address:address, description:description, coffee_price:1.6, tea_price:3.5, beer_price:3.2, wifi_identification:wifi_identification)
end

name = "Café des champs libres"
if rennes.places.find_by(name:name) == nil
	address = "10 Cours des Alliés, 35000 Rennes"
	description = ""
	wifi_identification = "Champs Libres"
	rennes.places.create!(name:name, address:address, description:description, coffee_price:1.5, tea_price:3.5, beer_price:3.4, wifi_identification:wifi_identification)
end