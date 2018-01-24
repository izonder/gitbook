# gitbook

Docker image based on [ANNY](https://hub.docker.com/r/izonder/anny)

[![](https://images.microbadger.com/badges/version/izonder/gitbook.svg)](https://microbadger.com/images/izonder/gitbook "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/izonder/gitbook.svg)](https://microbadger.com/images/izonder/gitbook "Get your own image badge on microbadger.com")
[![Build Status](https://travis-ci.org/izonder/gitbook.svg?branch=master)](https://travis-ci.org/izonder/gitbook)

## Features

- Configurable book engine, based on [GitBook](https://github.com/GitbookIO/gitbook)
- Watcher mode with hot-reloading
- CI/CD compatible

## How to use?

```
FROM izonder/gitbook:latest

...

# copy docs
COPY ./docs /src

...

# copy book.json
COPY ./book.json /src
```

## Use with CI/CD

```
FROM izonder/gitbook:latest

...

# copy book.json
COPY ./book.json /src

...

VOLUME /src/docs
```

In pipeline use command like:
```
$ rsync -avzhe ssh --delete ./docs user@myhost.tld:/var/docs
```
