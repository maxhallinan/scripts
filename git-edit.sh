#!/bin/bash
$EDITOR $(git status --porcelain | awk '{print $2}')
