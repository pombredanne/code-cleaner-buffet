ARG _alpine='3.11.0'

FROM alpine:"${_alpine}"
ARG _apk_gcc='9.2.0'
ARG _apk_libffi_dev='3.2.1'
ARG _apk_musl_dev='1.1.24'
ARG _apk_openssl_dev='1.1.1d'
ARG _apk_python3_dev='3.8.0'
ARG ansible_lint

LABEL org.opencontainers.image.title='Ansible Lint'
LABEL org.opencontainers.image.url='https://github.com/ansible/ansible-lint'
LABEL info.evolutics.buffet.categories='Linter'
LABEL info.evolutics.buffet.languages='Ansible'
LABEL info.evolutics.buffet.versions-url='https://pypi.org/project/ansible-lint/'
LABEL info.evolutics.buffet.version-example='4.2.0'

RUN apk add --no-cache \
    "gcc~=${_apk_gcc}" \
    "libffi-dev~=${_apk_libffi_dev}" \
    "musl-dev~=${_apk_musl_dev}" \
    "openssl-dev~=${_apk_openssl_dev}" \
    "python3-dev~=${_apk_python3_dev}" \
  && pip3 install "ansible-lint==${ansible_lint}"

WORKDIR /workdir

HEALTHCHECK CMD ansible-lint --version \
  && printf '- name: Example\n  hosts: all\n' > playbook.yml \
  && ansible-lint playbook.yml