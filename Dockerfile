FROM ruby:2.6.5

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler && \
    bundle config --local build.sassc --disable-march-tune-native && \
    bundle install --without=development,test

COPY . /app

RUN yarn install --check-files && bundle exec rails assets:precompile && bundle exec rails assets:clean

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Start the main process.
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
