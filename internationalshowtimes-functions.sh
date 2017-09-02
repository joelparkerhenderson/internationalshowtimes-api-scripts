#!/bin/sh

## 
# International Showtimes API shell script functions
#
# ## Tracking
#
#   * Command: internationalshowtimes-get-showtimes-by-cinema-id-and-movie-id.sh
#   * Version: 3.0.0
#   * Created: 2017-08-22
#   * Updated: 2017-09-02
#   * License: GPL
#   * Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
##

internationalshowtimes_get_cinemas_by_location(){
  latitude="$1"
  longitude="$2"
  curl -sSLG "http://api.internationalshowtimes.com/v4/cinemas" \
    -H "X-Api-Key: $INTERNATIONALSHOWTIMES_API_KEY" \
    --data-urlencode "location=$latitude,$longitude"
}

internationalshowtimes_get_cinema_id_by_name_and_location(){
  name="$1"
  latitude="$2"
  longitude="$3"
  curl -sSLG "http://api.internationalshowtimes.com/v4/cinemas" \
    -H "X-Api-Key: $INTERNATIONALSHOWTIMES_API_KEY" \
    --data-urlencode "location=$latitude,$longitude"
  jq -r ".cinemas[] | select(.name==\"$name\") | .id" |
  head -1
}

internationalshowtimes_get_movies_by_title(){
  title="$1"
  curl -sSLG "http://api.internationalshowtimes.com/v4/movies" \
    -H "X-Api-Key: $INTERNATIONALSHOWTIMES_API_KEY" \
    --data-urlencode "search_field=title" \
    --data-urlencode "search_query=$title_regex"
}

internationalshowtimes_get_movie_id_by_title(){
  title="$1"
  curl -sSLG "http://api.internationalshowtimes.com/v4/movies" \
    -H "X-Api-Key: $INTERNATIONALSHOWTIMES_API_KEY" \
    --data-urlencode "search_field=title" \
    --data-urlencode "search_query=$title" |
  jq -r ".movies[].id" |
  head -1
}

internationalshowtimes_get_showtimes_by_cinema_id_and_movie_id(){
  cinema_id="$1"
  movie_id="$2"
  curl -sSLG "http://api.internationalshowtimes.com/v4/showtimes" \
    -H "X-Api-Key: $INTERNATIONALSHOWTIMES_API_KEY" \
    --data-urlencode "cinema_id=$cinema_id" \
    --data-urlencode "movie_id=$movie_id" 
}

internationalshowtimes_get_datetimes_by_cinema_id_and_movie_id(){
  cinema_id="$1"
  movie_id="$2"
  curl -sSLG "http://api.internationalshowtimes.com/v4/showtimes" \
    -H "X-Api-Key: $INTERNATIONALSHOWTIMES_API_KEY" \
    --data-urlencode "cinema_id=$cinema_id" \
    --data-urlencode "movie_id=$movie_id" |
  jq -r ".showtimes[].start_at" 
}

internationalshowtimes_get_datetimes_by_cinema_name_and_location_and_movie_title(){
  cinema_name="$1"
  latitude="$2"
  longitude="$3"
  movie_title="$4"
  cinema_id=$(internationalshowtimes_get_cinema_id_by_name_and_location "$cinema_name" "$latitude" "$longitude")
  movie_id=$(internationalshowtimes_get_movie_id_by_title "$movie_title")
  internationalshowtimes_get_datetimes_by_cinema_id_and_movie_id "$cinema_id" "$movie_id"
}

