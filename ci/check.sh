#!/bin/sh

set -o errexit
set -o nounset
set -o pipefail

check_with_git() {
  git diff --check HEAD^
}

check_with_gitlint() {
  gitlint --config ci/.gitlint
}

check_with_hadolint() {
  git ls-files -z -- '*/Dockerfile' Dockerfile '*.Dockerfile' \
    | xargs -0 hadolint
}

check_with_hunspell() {
  dishes_dictionary="$(mktemp)"
  ls -1 dishes | sed 's/_/\n/g' > "${dishes_dictionary}"

  git log -1 --format=%B | \
    hunspell -l -d en_US -p ci/personal_words.dic -p "${dishes_dictionary}" \
    | sort | uniq | tr '\n' '\0' | xargs -0 -r -n 1 sh -c \
    'echo "Misspelling: $@"; exit 1' --

  rm "${dishes_dictionary}"
}

check_with_prettier() {
  prettier --check '**/*.+(json|md|yaml|yml)'
}

main() {
  check_with_git
  check_with_gitlint
  check_with_hadolint
  check_with_hunspell
  check_with_prettier
}

main "$@"
