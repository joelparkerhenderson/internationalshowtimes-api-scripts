# Demo of the International Showtimes API to get movies and showtimes

This demo connects to the International Showtimes API to get a list of movie showtimes.

To start, please see [International Showtimes API by Cinepass](https://api.cinepass.de/documentation/)


The API provides URIs that look like this:

    http://api.cinepass.de/v4/showtimes/
    ?lang=en
    &location=40.7527,73.9772
    &distance=5

The URI is a typical RESTful method with these pieces:

  * Entry point "http://api.cinepass.de"
  * Semantic version number "v4"
  * RESTful method "showtimes"
  * Query string with filters.

The API uses an API key that is typically sent as an HTTP header.


## Usage

Get your own API key:

  1. Go to [International Showtimes](http://internationalshowtimes.com)

  2. Request an API key for one of the free 30-day trial plans.

  3. These demo scripts use a convention of storing the API key in a shell environment variable, like this:

         export CINEPASS_API_KEY="a1b2c3d4e5f6g7h8i9j0" 

Use the demo scripts:

  1. Edit any of the demo scripts as you like.

  2. Run the script.

  3. The output is typical JSON text.


## Examples

Using the functions.sh file:

    cinepass_get_cinema_id_by_name_and_location "AMC Empire 25" "40.756359,-73.988873"
    41514

    cinepass_get_movie_id_by_title "Spider-Man: Homecoming"
    20345

    cinepass_get_showtimes_by_cinema_id_and_movie_id 41514 20345
    ...list of showtimes


## Sample data

Cinema:

  * AMC Empire 25
  * New York City
  * Street address: 234 W 42nd St, New York, NY 10036, USA
  * Latitude: 40.756359
  * Longitude: -73.988873
  * Location is within 2 kilometers of Grand Central Station
  * Cinepass API: cinema id 41514

Movie:

  * Spider-Man: Homecoming
  * Cinepass API: movie id 20345

Location:

  * Grand Central Station
  * New York City
  * Street address: 89 E 42nd St, New York, NY 10017, USA
  * Latitude: 40.7527
  * Longitude: -73.9772

