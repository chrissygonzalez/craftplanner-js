# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Material.create(name: "Quince & Co. Phoebe yarn")
Craft.create(title: "Regen Shawl", description: "When thinking of the theme of dots for this pattern (previously published in Making: Vol. 3 - DOTS) I found myself inspired by the patterns that rain drops and frozen water make on windows. This texture-rich shawl pairs soft circular combos of knit and purl stitches with a border that mimics the dots of falling rain. Regen shines in Phoebe by Quince & Co. and is a versatile and light accessory that is both engaging and relaxing to knit.", method: "knitting", source: "https://www.ravelry.com/patterns/library/regen-shawl")
CraftMaterial.create(craft_id: Craft.last.id, material_id: Material.last.id, quantity: 592)

Material.create(name: "Lily Sugar'n Cream Solids & Denim Tea Rose yarn")
Craft.create(title: "Waffle Crochet Spa Washcloth", description: "This spa style washcloth will pamper your skin – try stitching it in organic cotton for the ultimate in natural luxury. Measures a generous 9” square and is great for adults or babies. What a wonderful gift wrapped around a bar of handmade soap!", method: "crochet", source: "https://www.ravelry.com/patterns/library/waffle-crochet-spa-washcloth")
CraftMaterial.create(craft_id: Craft.last.id, material_id: Material.last.id, quantity: 332)

Material.create(name: "Medium weight woven fabric")
Craft.create(title: "Stowe Bag", description: "Designed by Fringe Supply Co., purveyors of fine knitting supplies, Stowe is the ideal project bag – whatever your project may be! The main compartment is perfect for works-in-progress while the many side pockets organize small tools, patterns & notebooks. It may have been designed with knitting in mind but you’ll find it equally useful for a variety of purposes from travel to everyday!", method: "sewing", source: "https://grainlinestudio.com/shop/accessories/stowe-bag-pdf/")
CraftMaterial.create(craft_id: Craft.last.id, material_id: Material.last.id, quantity: 2)