#!/usr/bin/env bash
# Initialize BASHSTRAP

# Reload Library
case $OSTYPE in
  darwin*)
    alias reload='source ~/.bash_profile'
    ;;
  *)
    alias reload='source ~/.bashrc'
    ;;
esac

# Only set $BASHSTRAP if it's not already set
if [ -z "$BASHSTRAP" ];
then
    # Setting $BASH to maintain backwards compatibility
    # TODO: warn users that they should upgrade their .bash_profile
    export BASHSTRAP=$BASH
    export BASH=`bash -c 'echo $BASH'`
fi

# Load composure first, so we support function metadata
source "${BASHSTRAP}/lib/composure.bash"

# support 'plumbing' metadata
cite _about _param _example _group _author _version

# library
LIB="${BASHSTRAP}/lib/*.bash"
for config_file in $LIB
do
  source $config_file
done

# Load enabled aliases, completion, plugins
for file_type in "aliases" "plugins"
do
  _load_bashstrap_files $file_type
done

# Load custom aliases, completion, plugins
for file_type in "aliases" "completion" "plugins"
do
  if [ -e "${BASHSTRAP}/${file_type}/custom.${file_type}.bash" ]
  then
    source "${BASHSTRAP}/${file_type}/custom.${file_type}.bash"
  fi
done

# Custom
CUSTOM="${BASHSTRAP}/custom/*.bash"
for config_file in $CUSTOM
do
  if [ -e "${config_file}" ]; then
    source $config_file
  fi
done

unset config_file
if [[ $PROMPT ]]; then
    export PS1="\["$PROMPT"\]"
fi

# Adding Support for other OSes
PREVIEW="less"
[ -s /usr/bin/gloobus-preview ] && PREVIEW="gloobus-preview"
[ -s /Applications/Preview.app ] && PREVIEW="/Applications/Preview.app"
