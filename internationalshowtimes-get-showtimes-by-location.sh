#!/bin/sh

## 
# International Showtimes API script to get showtimes by location
#
# Example:
#
#     $ export INTERNATIONALSHOWTIMES_API_KEY=123456679
#     $ get-showtimes-by-location "40.756359,-73.988873"
#
# Tracking:
#
#   * Command: internationalshowtimes-get-showtimes-by-location
#   * Version: 2.0.0
#   * Created: 2017-08-22
#   * Updated: 2017-08-24
#   * License: GPL
#   * Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
##

location="$1"

curl -sSLG "http://api.internationalshowtimes.com/v4/showtimes" \
  -H "X-Api-Key: wd0nBUl09eTwmBuOWXM3FlfENAUeC4Ai" \
  --data-urlencode "lang=en" \
  --data-urlencode "location=$1"
