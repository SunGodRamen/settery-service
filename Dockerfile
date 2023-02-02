# Ruby on Rails service Dockerfile
FROM ruby:3.2.0

# set working directory
WORKDIR /app

# copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# install gems
RUN bundle install

# copy application files
COPY . .

# run migrations
RUN bundle exec rake db:migrate

# expose port 3000
EXPOSE 3333

# start the server
CMD ["bundle", "exec", "rails", "server", "-p", "3333", "-b", "0.0.0.0"]