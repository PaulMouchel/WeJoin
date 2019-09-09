rennes = City.find_by(zip_code:"35000")
if rennes == nil
	rennes = City.create(name: "Rennes", zip_code:"35000")
end

name = "Loco Loca"
if rennes.places.find_by(name:name) == nil
	address = "17 Rue Comté de Lanjuinais, 35000 Rennes"
	description = "Espace contemporain stylé autour de la culture latine avec coffee-shop, bar à tapas, jardin et restaurant."
	rennes.places.create(name:name, address:address, description:description, coffee_price:1.6, tea_price:3.5, beer_price:3.2)
end

name = "Café des champs libres"
if rennes.places.find_by(name:name) == nil
	address = "10 Cours des Alliés, 35000 Rennes"
	description = ""
	rennes.places.create(name:name, address:address, description:description, coffee_price:1.5)
end