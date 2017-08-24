#!/bin/sh

## 
# International Showtimes API script to get cinema id by name and location
#
# Example:
#
#     $ export INTERNATIONALSHOWTIMES_API_KEY=123456679
#     $ get-cinema-id-by-name-and-location "AMC Empire 25" "40.756359,-73.988873"
#
# Tracking:
#
#   * Command: internationalshowtimes-get-cinema-id-by-name-and-location
#   * Version: 2.0.0
#   * Created: 2017-08-22
#   * Updated: 2017-08-24
#   * License: GPL
#   * Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
##

name="$1"
location="$2"

curl -sSLG "http://api.internationalshowtimes.com/v4/cinemas" \
  -H "X-Api-Key: $INTERNATIONALSHOWTIMES_API_KEY" \
  --data-urlencode "location=$location" |
  jq -r ".cinemas[] | select(.name==\"$name\") | .id" |
  head -1
