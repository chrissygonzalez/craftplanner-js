# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Craft has_many Projects, Material has_many CraftMaterials, etc.) 
- [x] Include at least one belongs_to relationship (CraftMaterial belongs_to Craft, Project belongs_to User, etc.)
- [x] Include at least two has_many through relationships (User has_many Crafts through Projects, Material has_many Crafts through CraftMaterials, etc.)
- [x] Include at least one many-to-many relationship (Craft has_many Materials through CraftMaterials, Material has_many Crafts through CraftMaterials)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (craft_material.quantity)
- [x] Include reasonable validations for simple model objects (Craft, Material, User, UserMaterial)
- [x] Include a class level ActiveRecord scope method (Project complete, incomplete, URL: users/:id)
- [x] Include signup (bcrypt, omniauth-twitter)
- [x] Include login (bcrypt, omniauth-twitter)
- [x] Include logout (session.delete)
- [x] Include third party signup/login (OmniAuth Twitter)
- [x] Include nested resource show or index (users/:id/user_materials)
- [x] Include nested resource "new" form (users/:id/user_materials/new)
- [x] Include form display of validation errors (/crafts/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
