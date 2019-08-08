# README

This is an app created for the wonderful team at Planning Center. It's aimed at the support team and would give them a place where they can add forms, widgets and giving modals to a website outside of the Planning Center apps for testing purposes.

## About the app

It's running on Ruby 2.6.1 with Rails 5.2.2.

## Installation

You can get started by cloning this repo using:

    git clone https://github.com/nicholaskillin/carlsbad_site.git

Change directory to the new app

    cd carlsbad_site

## Setup your database

    bundle install
    rake db:migrate

## Setup oAuth
You will need to setup your own oAuth client ID and secret to use in Development. Here are the steps required to do that.
    
- Go to https://api.planningcenteronline.com
- Click on "New Application" under the "My Developer Applications" section
- The App name, description and Url don't really matter. For the `Authorization callback URLs` you will need to use `https://localhost:3000/auth/planning_center/callback` on the first line and `https://carlsbad-website.herokuapp.com/auth/planning_center/callback` on the second line.
- Submit that new application.
- Now, back in your dev repo create a file called `application.yml' in the `config` folder.
- Add the `application.yml` file to your .gitignore
- Inside that file add your Client ID and Secret for your oAuth app

```
# PCO API
PCO_Client_ID: "CLIENT_ID_HERE"
PCO_Secret: "CLIENT_SECRET_HERE"
```

## Setting up SSL
In order to use the church center modals you will have to be using https:// locally.

- Create a folder called `ssl` in your `config` folder
- Navigate to the `ssl` folder in your terminal
- In terminal enter `openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout localhost.key -out localhost.crt`
- Answer the questions.
- Once this is done you should now have two files, `localhost.crt` and `localhost.key` in your `ssl` folder

Start your server

    `rails s -b 'ssl://localhost:3000?key=config/ssl/localhost.key&cert=config/ssl/localhost.crt'`

## In order to log into this app, you will need to be logged into org 1 in Planning Center, so you will want to switch to your Staff account before pulling up the app

and you should be up and running.