# README

This is an app created for the wonderful team at Planning Center. It's aimed at the support team and would give them a place where they can add forms, widgets and giving modals to a website outside of the Planning Center apps for testing purposes.

## About the app

It's running on Ruby 2.6.1 with Rails 5.2.2.

## Installation

You can get started by cloning this repo using:

    git clone https://github.com/nicholaskillin/carlsbad_site.git

Change directory to the new app

    cd carlsbad_site

Setup your database and run

    bundle install
    rake db:migrate
    rails s

Setup oAuth
You will need to setup your own oAuth client ID and secret to use in Development. Here are the steps required to do that.
    
- Go to https://api.planningcenteronline.com
- Click on "New Application" under the "My Developer Applications" section
- The App name, description and Url don't really matter. For the `Authorization callback URLs` you will need to use `https://127.0.0.1:3000/auth/planning_center/callback` on the first line and `https://carlsbad-website.herokuapp.com/auth/planning_center/callback` on the second line.
- Submit that new application.
- Now, back in your dev repo create a file called `application.yml' in the `config` folder.
- Add the `application.yml` file to your .gitignore
- Inside that file add your Client ID and Secret for your oAuth app

```
# PCO API
PCO_Client_ID: "CLIENT_ID_HERE"
PCO_Secret: "CLIENT_SECRET_HERE"
```

and you should be up and running.