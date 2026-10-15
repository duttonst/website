#!/bin/sh
set -eu

# Resolve paths relative to this script, regardless of the caller's directory.
project_root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$project_root"

# Build a fresh archive, retaining any previous archive until this succeeds.
package_dir=$(mktemp -d "${TMPDIR:-/tmp}/playlisty-package.XXXXXX")
trap 'rm -rf "$package_dir"' EXIT
trap 'exit 1' HUP INT TERM

COPYFILE_DISABLE=1 zip -r "$package_dir/home.zip" home .htaccess \
  -x '*.DS_Store' '*/._*' '__MACOSX/*' '*/__MACOSX/*' \
  '*/.Spotlight-V100/*' '*/.Trashes/*' '*/.fseventsd/*'

mv -f "$package_dir/home.zip" "$project_root/home.zip"
printf '\nCreated %s/home.zip\nIn cPanel, extract into public_html (not public_html/home).\nThe archive includes home/ and the root .htaccess.\n' "$project_root"
