#!/bin/bash

find $(cd "$(dirname "${0}")"; echo "$(pwd)") -type f,l ! -name '*.*' -exec strfile {} \;
