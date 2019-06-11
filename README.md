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

- A free Heroku account: https://signup.heroku.com/login
- Heroku CLI: https://devcenter.heroku.com/articles/heroku-cli
- Git: https://git-scm.com/downloads

## Installation / Setup

These instructions assume some familiarity with the using command line.

1. Clone this repository:
   ```
   git clone https://github.com/unosmium/unosmium.git && cd unosmium
   ```
2. Login to Heroku CLI:
   ```
   heroku login
   ```
3. Create a new app on Heroku
   ```
   heroku create
   ```
4. Deploy to Heroku:
   ```
   git push heroku master
   ```
5. Open the app and complete the Tournament Director setup pages in your
   browser:
   ```
   heroku open
   ```

## Features

Unosmium provides a customized website with the following features:

- Record-keeping of participating teams for the Tournament Director
- Remote scores entry for the Event Supervisors
- Real-time Awards Ceremony slideshow generation
- Printable results PDF output
- Online results hosting at (a link to some GitHub pages site, TBD)

