ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION}-alpine AS base

RUN apk add --no-cache \
    curl git ruby-dev make gcc libc-dev nodejs npm libpq-dev postgresql-client tzdata vips-dev

ARG RAILS_VERSION
RUN gem install rails:${RAILS_VERSION}

FROM base AS development

RUN apk add --no-cache bash zsh less openssh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# minio の設定
RUN mkdir /minio
WORKDIR /minio
RUN wget https://dl.min.io/server/minio/release/linux-amd64/minio && \
    chmod +x minio
ARG BUCKET
RUN mkdir -p /mnt/data/${BUCKET}

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
