FROM ruby:3-buster
RUN apt-get update -qq && apt-get install -y nodejs netcat

# ruby comes with older versions of bundler sometimes
RUN gem install bundler -v "2.3.14"

# WARNING
# note: context is changed, see ../../docker-compose.rails-7-barebones.yml

ADD ./ /splunk-otel-ruby
ENV SPLUNK_OTEL_LOCATION="/splunk-otel-ruby"

WORKDIR /splunk-otel-ruby/examples/rails-7-barebones
RUN bundle install

CMD ["bundle", "exec", "rackup", "app.ru", "--host", "0.0.0.0", "-p", "3000"]
