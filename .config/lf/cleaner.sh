#!/usr/bin/env sh

cat <<EOF | paste -sd '' >"$LF_TEMPDIR/fifo"
{
"action": "remove",
"identifier": "lf-preview"
}
EOF
