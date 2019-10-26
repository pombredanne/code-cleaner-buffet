ARG _alpine='3.10.2'

FROM alpine:"${_alpine}"
ARG _apk_yarn='1.16.0'
ARG addons_linter

LABEL org.opencontainers.image.title='Add-ons Linter'
LABEL org.opencontainers.image.url='https://github.com/mozilla/addons-linter'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='CSS,HTML,JavaScript'
LABEL info.evolutics.buffet.versions-url='https://yarnpkg.com/en/package/addons-linter'

RUN apk add --no-cache "yarn~=${_apk_yarn}" \
  && yarn global add "addons-linter@${addons_linter}"

WORKDIR /workdir

HEALTHCHECK CMD \
  echo '{ "manifest_version": 2, "name": "Borderify", "version": "1.0" }' \
  > manifest.json && addons-linter .