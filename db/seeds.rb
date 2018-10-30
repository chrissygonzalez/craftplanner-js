# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Material.create(name: "Pink Malabrigo worsted weight wool")
Craft.create(title: "Knitted Hat", description: "This is a knitted hat.", method: "knitting", source: "http://ravelry.com")
CraftMaterial.create(craft_id: Craft.last, material_id: Material.last)

Material.create(name: "Liberty lawn")
Craft.create(title: "Alder dress", description: "Grainline Studios Alder dress.", method: "sewing", source: "http://grainlinestudio.com")
CraftMaterial.create(craft_id: Craft.last, material_id: Material.last)

Material.create(name: "10 oz Cone Mills denim")
Craft.create(title: "Ginger jeans", description: "Jeans that are flattering for everyone.", method: "sewing", source: "http://idontknow.com")
CraftMaterial.create(craft_id: Craft.last, material_id: Material.last)