FROM ruby:2.6.3
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client yarn
RUN mkdir /test_app
WORKDIR /test_app
# A project létrehozásánál kommentezzük ki a --- közötti sorokat.
#---------------------
COPY Gemfile /test_app/Gemfile
COPY Gemfile.lock /test_app/Gemfile.lock
COPY package.json /test_app/package.json
COPY yarn.lock /test_app/yarn.lock
RUN gem install bundler -v '2.0.2'
RUN bundle install
RUN yarn install --check-files
COPY . /test_app
#--------------------
EXPOSE 3000