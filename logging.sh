#!/usr/bin/env bash
function logColour {
  name=$1
  colour=$2
  command=$3

  echo "content: $command"

  eval "${command}" | sed "s/.*/$(tput setaf $colour) $name ->[&]$(tput sgr0)/" &

}

function readConfig {
  CONFIG_FILE=$1
  DELIMITER=";"
  while read -r line || [[ -n "$line" ]];
    do
    #   Split variables by character `;`
    if printf '%s\n' "$line" | grep -q -e ${DELIMITER}; then
        name=$(printf '%s\n' "$line" | cut -d${DELIMITER} -f1)
        colour=$(printf '%s\n' "$line" | cut -d${DELIMITER} -f2)
        command=$(printf '%s\n' "$line" | cut -d${DELIMITER} -f3)
        logColour ${name} ${colour} "${command}"
    fi
    done < "$CONFIG_FILE"
    
}

readConfig $1
