#!/bin/bash

find $(cd "$(dirname "${0}")"; echo "$(pwd)") -type f ! -name '*.*' -exec strfile {} \;
