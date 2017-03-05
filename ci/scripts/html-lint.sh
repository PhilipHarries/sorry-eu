#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -u

fails=0
for htmlfile in ./sorryeu-repo/site/*.html;do
  if tidy --drop-empty-elements no "${htmlfile}";then
    echo "Test passed successfully"
  else
    echo "HTML linting failed"
    fails=$(( fails + 1 ))
  fi
done

echo

if [[ "${fails}" == 0 ]];then
  echo "all tests passed"
  exit 0
else
  echo "${fails} tests failed"
  exit 1
fi
