#!/bin/bash
#
# This script copies dotfiles from the git repo into the homedir.
#
# WARNING: Existing files with the same name will be replaced! This is a one-way operation.
#
cp -R .* ~/.
