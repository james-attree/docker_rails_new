FROM ruby:2.7.4

ENV APP_ROOT /app
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

RUN curl -sL https://deb.nodesource.com/setup_14.x -o setup_14.sh && sh ./setup_14.sh && rm setup_14.sh
RUN apt-get install -y nodejs && apt-get clean

RUN npm install --global yarn
RUN gem install rails

EXPOSE 3000
CMD ["rails", "new", ".", "-d", "mysql"]