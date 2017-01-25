# Today I Learned Perfect Sample App

This is a simple web app to demonstrate Perfect, a popular server side web framework. Specifically, it shows the following:

* Routing
* Working with JSON
* Templating with Mustache
* Persistence with Postgres and StORM, a Swift ORM for Perfect

The web app helps you keeps track of abbreviations - like "BRB" - and what they mean - like "Be Right Back."

# Building & Running

Basically you need postgres running and either use the pre-set login info provided below, or modify the code accordingly.

1. Download [Perfect Assistant](http://perfect.org/en/assistant/) 
2. In Perfect Assistant, click "Create New Project", and select "Custom Repository URL". Choose a location for the project, and enter this URL for "Repository URL": `https://github.com/rwenderlich/hello-persistence`
3. Install [Homebrew](http://brew.sh) and run the following commands:

```
brew update
brew install libxml2
brew install postgres
brew services start postgresql
createuser -D -A -P perfect (enter "perfect" for the password when prompted)
createdb -O perfect perfect_testing
```

4. Click Regenerate Xcode project, and open project in Xcode 8.2.1+, set build dropdown to the second hello-persistence target (w/ black terminal icon).
5. Click Edit Scheme for the second hello-persistence target (w/ black terminal icon), and in the Run Options, set the Working Directory to the directory for your project.
6. Build & run.
7. Browse to [http://localhost:8080/til](http://localhost:8080/til). Enter a test acronym, like "BRB" and "Be Right Back". Enjoy!



