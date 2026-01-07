#!/usr/bin/env bash
set +e

VERSION_FILE="Overtchat/runtime/version.json"

PROJECT_NAME="Service-Overtchat"
INSTALLED="unknown"
SOURCE="unknown"

if [[ -f "$VERSION_FILE" ]]; then
    PROJECT_NAME=$(jq -r '.project.name // "Service-Overtchat"' "$VERSION_FILE" 2>/dev/null)
    INSTALLED=$(jq -r '.version.installed // "not installed"' "$VERSION_FILE" 2>/dev/null)
    SOURCE=$(jq -r '.source.type // "unknown"' "$VERSION_FILE" 2>/dev/null)
fi

clear 2>/dev/null || true

cat <<'EOF'
         _____                 _
        / ____|               (_)
       | (___   ___ _ ____   _ _  ___ ___
        \___ \ / _ \ '__\ \ / / |/ __/ _ \
        ____) |  __/ |   \ V /| | (_|  __/
       |_____/ \___|_|    \_/ |_|\___\___/
  ____                 _        _           _
 / __ \               | |      | |         | |
| |  | |_   _____ _ __| |_  ___| |__   __ _| |_
| |  | \ \ / / _ \ '__| __// __| '_ \ / _` | __|
| |__| |\ V /  __/ |  | |_| (__| | | | (_| | |_
 \____/  \_/ \___|_|   \__|\___|_| |_|\__,_|\__|


Project  : $PROJECT_NAME
Version  : $INSTALLED
Source   : $SOURCE


by SerVuS
EOF
