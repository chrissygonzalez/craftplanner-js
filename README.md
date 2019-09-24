## CraftPlanner-JS

CraftPlanner-JS is a Ruby on Rails app for keeping track of craft projects and craft materials with a few, new front-end Javascript enhancements. I added the Javascript as the final project for Learn.co's Rails and Javascript section section (blog post [here](https://chrissygonzalez.github.io/rails_at_last)).

![Browse Crafts](https://i.imgur.com/VxytLoH.gif)

### How to Use
CraftPlanner was built on Ruby 2.3.3 and uses Bundler to install gem dependencies. You'll probably need a similar set-up to get it to run correctly.

#### Installation
1. First, clone or download this repo.
2. `cd` into the craftplanner-js directory and run `bundle install` to install all the required gems.
3. Enter `rake db:migrate` to run the database migrations.
4. Enter `rake db:seed` to install a little sample data.
5. Start the rails server by typing `rails server` or `rails s`.

#### Using the app
1. Create an account with name and password, or use your Twitter account to sign in to CraftPlanner.
2. After signing in, you'll land on the Project Planner page, which contains a list of projects that are in progress or have been completed.
3. To start a new project, navigate to the Crafts section, choose a project by clicking on its name, and clicking the Start Project button.
4. To end or delete a project, click the End Project or Delete Project buttons on the Planner page.
5. Add a new Craft Project or Material by clicking the New button in each of those sections.
6. Add a material to your Stash by clicking the Add Material button and either choosing an existing one from the list or entering a new one in the form.
7. Enjoy your craftiness!

#### Javascript Enhancements
1. At the bottom of the Project Planner page, Craft descriptions and links are now [available for browsing](https://i.imgur.com/VxytLoH.gif).
2. On the Materials page, the Show Crafts button reveals a [list of crafts](https://i.imgur.com/b8oOBW4.gif) using that material inline.
3. On the Add to my stash form, see [immediate feedback](https://i.imgur.com/UMb0wYT.gif) that an item has been added.