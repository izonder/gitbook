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
##############################################################################

EXPOSE 80
CMD ["gitbook", "serve"]
