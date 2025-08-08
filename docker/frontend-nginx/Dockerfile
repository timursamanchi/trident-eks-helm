# Build Jekyll site
FROM ruby:3.2-alpine AS jekyll-builder

WORKDIR /site

RUN apk add --no-cache build-base gcc libffi-dev yaml-dev

COPY Gemfile* ./
RUN bundle install

COPY . .
RUN JEKYLL_ENV=production bundle exec jekyll build -d /output

# Serve it with NGINX
FROM nginx:alpine
COPY --from=jekyll-builder /output /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]