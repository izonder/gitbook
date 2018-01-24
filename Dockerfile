FROM izonder/anny:latest

MAINTAINER Dmitry Morgachev <izonder@gmail.com>

##############################################################################
# Copy sources
##############################################################################

WORKDIR /src
COPY ./nginx/default.conf /etc/nginx/conf.d/gitbook.conf

RUN set -x \

##############################################################################
# Install dependencies
# NOTE: this `gitbook init` will install all packages
##############################################################################

    && yarn global add gitbook-cli --prefix /usr/local \
    && gitbook init \

##############################################################################
# Clean up
##############################################################################

    && yarn cache clean \
    && rm -rf \
        /tmp/* \
        /var/cache/apk/* \
    && echo "OK!"

##############################################################################
# Entry point
# NOTE: this `gitbook init` will check and generate
# default README.md and SUMMARY.md if they don't exist
##############################################################################

EXPOSE 80
CMD gitbook init && gitbook serve
