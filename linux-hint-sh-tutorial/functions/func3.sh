#!/bin/bash

# check function working or not
function funcCheck() {
    returningValue="Using Function right now"
    echo "$returningValue"
}

returningValue="I love MAC"
echo $returningValue

funcCheck
echo $returningValue