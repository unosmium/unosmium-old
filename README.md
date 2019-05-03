# Unosmium

**Note: Unosmium is still under development. This README describes what we would
like the status to be at the intial release.**

Unosminum is an open-source decentralized scoring system for Science Olympiad
tournaments.

To set up Unosmium for your next Science Olympiad Invitational (or
States/Nats?), follow the instructions below.

Alternatively, contact unosmium@gmail.com to have an instance of Unosmium setup
for you. We ask for a payment of $10 for this service. Regardless, the results
of your tournament will always be freely accessible to you at (link to GitHub
pages site).

## Prerequisites

- Git: https://git-scm.com/downloads
- A free Heroku account: https://signup.heroku.com/login
- Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli

## Instructions

These instructions assume some familiarity with the using command line.

1. Create a new app at <https://dashboard.heroku.com/apps>. We recommend choosing
   a long name that would be difficult to guess to avoid risk of DDoS attacks.
2. Open up a terminal on your desktop.
3. Clone this repository:
   ```
   git clone https://github.com/zqianem/unosmium.git
   ```
4. Login to Heroku CLI:
   ```
   heroku login
   ```
5. Deploy to Heroku:
   ```
   heroku git:remote -a [name of the app from step 1]
   git push heroku master
   ```
   Replace "[name of the app from step 1]" with the actual app name, e.g:
   ```
   heroku git:remote -a scienceolympiadunosmiumtournament
   git push heroku master
   ```
6. Open the app at the URL given after the push and complete the Tournament
   Director setup pages.

## Features

Unosmium provides a customized website with the following features:

- Record-keeping of participating teams for the Tournament Director
- Remote scores entry for the Event Supervisors
- Real-time Awards Ceremony slideshow generation
- Printable results PDF output
- Online results hosting at (a link to some GitHub pages site, TBD)

