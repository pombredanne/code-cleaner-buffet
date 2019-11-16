ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG _yarn_prettier='1.19.1'
ARG prettier_toml

LABEL org.opencontainers.image.title='Prettier Toml Plugin'
LABEL org.opencontainers.image.url='https://github.com/bd82/toml-tools/tree/master/packages/prettier-plugin-toml'
LABEL info.evolutics.buffet.categories='Formatter'
LABEL info.evolutics.buffet.languages='TOML'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/prettier-plugin-toml'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add \
    "prettier-plugin-toml@${prettier_toml}" \
    "prettier@${_yarn_prettier}"

WORKDIR /workdir

HEALTHCHECK CMD echo 'foo  =  "bar"' | prettier --stdin-filepath main.toml