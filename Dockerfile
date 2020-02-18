FROM ruby:2.6.5

RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends

COPY . /usr/src/app/

WORKDIR /usr/src/app
RUN gem install mini_magick

CMD ["ruby", "charset_manipulator.rb"]
