#!/bin/bash

echo "Starting to create nvim configuration..."

XDG_CONFIG_HOME="${HOME}/.config"
LUA_INIT="${XDG_CONFIG_HOME}/nvim/init.lua"
LAZY_CONFIG="${XDG_CONFIG_HOME}/nvim/lua/config"


if [ ! -f $LUA_INIT ]; then
	echo "### Creating lua init file because it does not exist"
	mkdir -p "${XDG_CONFIG_HOME}/nvim"
	touch $LUA_INIT
fi


echo "### Checking if require config.lazy is configured..."
require=$(grep -E "^require\(\"config.lazy\"\)$" $LUA_INIT)


if [ -z "${require}" ]; then
	echo -e "\n-- LAZY CONFIG\nrequire(\"config.lazy\")" >> "${XDG_CONFIG_HOME}/nvim/init.lua"
	echo "### lazy config added to lua file"
fi

mkdir -p $LAZY_CONFIG
cp lazy.lua $LAZY_CONFIG
