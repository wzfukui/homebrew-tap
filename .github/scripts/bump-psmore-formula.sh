#!/usr/bin/env bash
set -euo pipefail

REPO="wzfukui/psmore"
FORMULA="Formula/psmore.rb"
API_URL="https://api.github.com/repos/${REPO}/releases/latest"

if ! command -v jq >/dev/null 2>&1; then
  echo "jq not found, please install jq to run this script."
  exit 1
fi

LATEST_TAG=$(curl -fsSL "$API_URL" | jq -r '.tag_name')
if [[ -z "${LATEST_TAG}" || "${LATEST_TAG}" == "null" ]]; then
  echo "failed to read latest tag from ${API_URL}"
  exit 1
fi

NEW_URL="https://github.com/${REPO}/archive/refs/tags/${LATEST_TAG}.tar.gz"
TMP_TARBALL=$(mktemp)
curl -fsSL "$NEW_URL" -o "$TMP_TARBALL"
NEW_SHA256=$(shasum -a 256 "$TMP_TARBALL" | awk '{print $1}')
rm -f "$TMP_TARBALL"

CURRENT_URL=$(grep -E '^  url ' "$FORMULA" | awk '{print $2}' | tr -d '"')

if [[ "${CURRENT_URL}" == "${NEW_URL}" ]]; then
  echo "updated=false" >> "${GITHUB_OUTPUT:-/dev/null}"
  echo "version=${LATEST_TAG}" >> "${GITHUB_OUTPUT:-/dev/null}"
  echo "psmore formula is already up to date: ${LATEST_TAG}"
  exit 0
fi

perl -0pi -e "s|^\\s*url \".*\"|  url \\\"${NEW_URL}\\\"|m" "$FORMULA"
perl -0pi -e "s|^\\s*sha256 \".*\"|  sha256 \\\"${NEW_SHA256}\\\"|m" "$FORMULA"

echo "updated=true" >> "${GITHUB_OUTPUT:-/dev/null}"
echo "version=${LATEST_TAG}" >> "${GITHUB_OUTPUT:-/dev/null}"
echo "updated formula to ${LATEST_TAG} with sha256 ${NEW_SHA256}"
