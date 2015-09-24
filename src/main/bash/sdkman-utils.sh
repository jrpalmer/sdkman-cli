#!/bin/bash

#
#   Copyright 2012 Marco Vermeulen
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

function __sdkman_path_contains {
    local candidate="$1"
    local exists=$(echo "$PATH" | grep "$candidate")
    if [[ -n "$exists" ]]; then
        sdkman_candidate_in_path='true'
    else
        sdkman_candidate_in_path='false'
    fi
}

function __sdkman_add_to_path {
    local candidate="$1"
    __sdkman_path_contains "$candidate"
    if [[ "$sdkman_candidate_in_path" == 'false' ]]; then
        PATH="$SDKMAN_DIR/$candidate/current/bin:$PATH"
    fi
}