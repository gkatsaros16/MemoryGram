# MyStream
[Visit BetterCheddar on Heroku](https://Mystreamspace.herokuapp.com/)
### Synopsis
This is a combination of social media platforms. MyStream, takes the majority of instagram and allows the user
to incorporate some of the best feautures from Facebook and Reddit.

### Features
* Create and update your personal account.
* Optionally add an avatar to further personalize their account.
* Create new posts that are either images or articles.
* Click a green highlighted article to visit it's page.
* Like and comment on any users content.
* Follow users to customize streams feed.

### Installation
1. In a terminal, run `git clone https://github.com/gkats/mystream`.
1. Navigate to the project's root directory with `cd mystream`.
1. Run `bundle install && rake db:setup`.
1. In two separate terminals, run `rails server` from the project's root directory.
1. Visit http://localhost:3000 in your browser.

### Technologies Used
* Backend: Rails 5.0.0.1
* User Authentication: Devise
* Image Uploader: Paperclip
* Image Hosting: Amazon Web Services (s3)
* Like/comment: jQuery
* Styling: Bootstrap
* Database: Postgres
* Testing: RSpec and FactoryGirl
* Pagination: Kaminari
