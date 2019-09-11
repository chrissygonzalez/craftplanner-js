## CraftPlanner-JS

Update in progress, old README below:

---------

CraftPlanner is a Ruby on Rails app for keeping track of future, completed, or in-progress craft projects, as well as craft materials you currently have in your stash. I built CraftPlanner as the final project for Learn.co's Rails section (blog post [here](https://chrissygonzalez.github.io/rails_at_last)).

![Behold the CraftPlanner](https://i.imgur.com/8YU3yWB.jpg?1)

### How to Use
CraftPlanner was built on Ruby 2.3.3 and uses Bundler to install gem dependencies. You'll probably need a similar set-up to get it to run correctly.

#### Installation
1. First, clone or download this repo.
2. `cd` into the CraftPlanner directory and run `bundle install` to install all the required gems.
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