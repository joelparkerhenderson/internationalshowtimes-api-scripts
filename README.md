# Demo of the International Showtimes API 

This demo connects to the International Showtimes API to get data about cinemas, movies, showtimes, etc.

To start, please see [International Showtimes API](https://api.internationalshowtimes.com/documentation/)


## Examples

Examples of using these scripts:

    $ internationalshowtimes-get-cinemas-by-location "40.756359,-73.988873"
    ... JSON list of cinemas near Grand Central Station in New York City

    $ internationalshowtimes-get-cinema-id-by-name-and-location "AMC Empire 25" 40.756359,-73.988873"
    41514

    $ internationalshowtimes-get-movies-by-title "Spider-Man"
    ... JSON list of movies that have Spider-Man in the title

    $ internationalshowtimes-get-movie-id-by-title "Spider-Man: Homecoming"
    20345

    $ internationalshowtimes-get-showtimes-by-cinema-id-and-movie-id 41514 20345
    ... JSON list of showtimes at AMC Empire 25 of Spider-Man: Homecoming


## API overview

The API provides URIs that look like this:

    http://api.internationalshowtimes.com/v4/showtimes/
    ?lang=en
    &location=40.7527,73.9772
    &distance=5

The URI is a typical RESTful method with these pieces:

  * Entry point "http://api.internationalshowtimes.com"
  * Semantic version number "v4"
  * RESTful method "showtimes"
  * Query string with filters.

The API uses an API key that is typically sent as an HTTP header.


## API setup

Get your own API key:

  1. Go to [International Showtimes](http://internationalshowtimes.com)

  2. Request an API key for one of the free 30-day trial plans.

  3. These demo scripts use a convention of storing the API key in a shell environment variable, like this:

         export INTERNATIONALSHOWTIMES_API_KEY="a1b2c3d4e5f6g7h8i9j0" 


## Sample data

Cinema:

  * AMC Empire 25
  * New York City
  * Street address: 234 W 42nd St, New York, NY 10036, USA
  * Latitude: 40.756359
  * Longitude: -73.988873
  * Location is within 2 kilometers of Grand Central Station
  * International Showtimes API: cinema id 41514

Movie:

  * Spider-Man: Homecoming
  * International Showtimes API: movie id 20345

Location:

  * Grand Central Station
  * New York City
  * Street address: 89 E 42nd St, New York, NY 10017, USA
  * Latitude: 40.7527
  * Longitude: -73.9772

