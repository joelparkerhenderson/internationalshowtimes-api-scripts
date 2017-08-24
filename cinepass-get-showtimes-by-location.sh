#!/bin/sh

## 
# Cinepass API script to get showtimes by location
#
# Example:
#
#     $ export CINEPASS_API_KEY=123456679
#     $ get-showtimes-by-location "40.756359,-73.988873"
#
# Tracking:
#
#   * Command: cinepass-get-showtimes-by-location
#   * Version: 1.0.0
#   * Created: 2017-08-22
#   * Updated: 2017-08-24
#   * License: GPL
#   * Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
##

location="$1"

curl -sSLG "http://api.cinepass.de/v4/showtimes" \
  -H "X-Api-Key: wd0nBUl09eTwmBuOWXM3FlfENAUeC4Ai" \
  --data-urlencode "lang=en" \
  --data-urlencode "location=$1"
