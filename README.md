## SimpleSurvey

The is a simple app that allows user to create any number of surveys of a single question that has yes or no answers. User can see the yes and no percentages of each survey on home page. User can re-answer a survey at any time. 

### Dependencies
* Ruby 2.6.3
* Rails 6.0.2
* SQLite

### How to start  the app on local environment
There are some seed data to help you verify the functionalities of the app. To start the app, run the following steps:
1. `bundle install`
2. `bundle exec rake db:create db:migrate db:seed`
3. `bundle exec rails server`
4. visit `localhost:3000` to interact with the app.

### How to run the test suite
There are rspec unit tests on the models, controllers and integration tests in `spec/features` folder. To run all the tests, run `bundle exec rspec`.

### Assumptions and decisions made
* When user changes answer to a survey, we update that answer to existing response if existent. We only keep one response per question per user.
* One endpoint is used to handle both creation and update of a response, in an *upsert* fashion. This helps simplify and unify UI treatment and user experience.
* I used background highlight to indicate user answers on question show page as opposed to using a radio box group or dropdown. This helps minimize user friction in making a choice. 
* Validations were added to check presence of survey question content and uniqueness of user-question pair for survey responses to ensure health and sanity of the data. 
* Counter cache was implemented with model callback and `yes_count` and `no_count` columns on `questions` table. This helps scaling of the system when each survey could have thousands of responses and counting on the fly could be inefficient and affect page load performance.

### Feature Checklist
- [x]  A user should be able to create any number of surveys
- [x]  A survey consists of one question represented as a single string. The answer to the question is always Yes or No.
- [x] The home screen of your app should show a list of surveys and a button to create a new one
- [x] Authentication stubbed
- [x]  A user can respond to a survey by clicking into it from the list mentioned above
 - [x] A survey can be answered multiple times with a yes/no response
 - [x] You should keep track of when each of the survey responses are saved
	 * Captured by `created_at` and `updated_at` of `responses`.
 - [x] You should display the results of the survey on the home screen with the percentage of yes and no responses.
- [x] You should make sure that your app can be run by other developers on the team.
-  [x] Make sure all of your dependencies are listed in your Gemfile and instructions are provided for setup if needed.
- [x]  You should use SQLite to persist your data.

###  Out of Scope Features
The following features could be useful addition to the app but are currently out of scope:
* Persist audit trail of when a user changes his/her answers, in case that data is useful.
* Allow and only allow survey owner to edit survey question when no answer is provided yet.
* Allow and only allow survey owner to delete a survey.  
* On index page, show when each survey was last answered.
* On index page, indicate whether the current user has answered a survey or not in each survey row.
* On index page, allow sorting for the most agreeable and  un-agreeable survey questions.
* If we are likely to support multiple questions per survey in the near future, we can add `survey` entity to have `survey -> questions -> responses` relationships.  For now, we are keeping things simple according to spec.
