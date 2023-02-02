# Ruby on Rails service Dockerfile
FROM ruby:2.7.2

# install necessary packages
RUN apt-get update && apt-get install -y \
  nodejs \
  postgresql-client

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

# set environment variable
ENV RAILS_ENV=production

# expose port 3000
EXPOSE 3000

# start the server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
