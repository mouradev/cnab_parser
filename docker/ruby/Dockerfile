FROM ruby:2.3.3

WORKDIR /app
COPY . /app

RUN bundle install

EXPOSE 3000

CMD ["shotgun", "--host=0.0.0.0", "--port=3000"]