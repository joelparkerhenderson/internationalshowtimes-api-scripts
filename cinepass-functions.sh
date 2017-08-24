#!/bin/sh

## 
# Cinepass API shell script functions
#
# Tracking:
#
#   * Command: cinepass-get-showtimes-by-cinema-id-and-movie-id.sh
#   * Version: 1.0.0
#   * Created: 2017-08-22
#   * Updated: 2017-08-24
#   * License: GPL
#   * Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)
##

cinepass_get_cinemas_by_location(){
  location="$2"
  curl -sSLG "http://api.cinepass.de/v4/cinemas" \
    -H "X-Api-Key: $CINEPASS_API_KEY" \
    --data-urlencode "location=$location"
}

cinepass_get_cinema_id_by_name_and_location(){
  name="$1"
  location="$2"
  curl -sSLG "http://api.cinepass.de/v4/cinemas" \
    -H "X-Api-Key: $CINEPASS_API_KEY" \
    --data-urlencode "location=$location" |
  jq -r ".cinemas[] | select(.name==\"$name\") | .id" |
  head -1
}

cinepass_get_movies_by_title(){
  title="$1"
  curl -sSLG "http://api.cinepass.de/v4/movies" \
    -H "X-Api-Key: $CINEPASS_API_KEY" \
    --data-urlencode "search_field=title" \
    --data-urlencode "search_query=$title_regex"
}

cinepass_get_movie_id_by_title(){
  title="$1"
  curl -sSLG "http://api.cinepass.de/v4/movies" \
    -H "X-Api-Key: $CINEPASS_API_KEY" \
    --data-urlencode "search_field=title" \
    --data-urlencode "search_query=$title" |
  jq -r ".movies[].id" |
  head -1
}

cinepass_get_showtimes_by_cinema_id_and_movie_id(){
  cinema_id="$1"
  movie_id="$2"
  curl -sSLG "http://api.cinepass.de/v4/showtimes" \
    -H "X-Api-Key: $CINEPASS_API_KEY" \
    --data-urlencode "cinema_id=$cinema_id" \
    --data-urlencode "movie_id=$movie_id" 
}

cinepass_get_datetimes_by_cinema_id_and_movie_id(){
  cinema_id="$1"
  movie_id="$2"
  curl -sSLG "http://api.cinepass.de/v4/showtimes" \
    -H "X-Api-Key: $CINEPASS_API_KEY" \
    --data-urlencode "cinema_id=$cinema_id" \
    --data-urlencode "movie_id=$movie_id" |
  jq -r ".showtimes[].start_at" 
}

cinepass_get_datetimes_by_cinema_name_and_cinema_location_and_movie_title(){
  cinema_name="$1"
  cinema_location="$2"
  movie_title="$3"
  cinema_id=$(cinepass_get_cinema_id_by_name_and_location "$cinema_name" "$cinema_location")
  movie_id=$(cinepass_get_movie_id_by_title "$movie_title")
  cinepass_get_datetimes_by_cinema_id_and_movie_id "$cinema_id" "$movie_id"
}

