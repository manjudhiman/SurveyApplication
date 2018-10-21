# SurveyApplication

SurveyApplication is a small rails application which helps in creating surveys.
Things you may want to cover:

* Ruby version - ruby-2.4.3
* Rails version - 5.2.1

## Getting Started

  1. Clone the repository
  2. Download [postgresql](https://www.postgresql.org/download/) if not already present.
  3. Install bundler
      ```
        gem install bundler
      ```
  4. Install Gems
     ```
        bundle install
     ```
  5. In order to run locally, migrate the database
     ```
        rails db:create db:migrate RAILS_ENV=<development, test>
     ```
  6. Start the server
     ```
       rails s
     ```
      hit http://localhost:3000/users/sign_in

  7. Use postman, to hit the surveys api end point :
     ```
       http://localhost:3000/surveys/list
     ```
  8. Use postman, to hit the questions api end point :
     ```
       http://localost:3000/questions
     ```