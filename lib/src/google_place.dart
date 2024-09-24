library google_place;

import 'package:google_place/google_place.dart';
import 'package:google_place/src/autocomplete/autocomplete.dart';
import 'package:google_place/src/details/details.dart';
import 'package:google_place/src/photos/photos.dart';
import 'package:google_place/src/query_autocomplete/query_autocomplete.dart';

/// The Places API is a service that returns information about places.
/// Places are defined within this API as establishments, geographic locations, or prominent points of interest.
class GooglePlace {
  /// [apiKEY] Your application's API key. This key identifies your application.
  final String apiKEY;

  /// [search] returns a list of places based on a user's location or search string.
  late Search search;

  /// [details] returns more detailed information about a specific place, including user reviews.
  late Details details;

  /// [photos] provides access to the millions of place-related photos stored in Google's Place database.
  late Photos photos;

  /// [autocomplete] automatically fills in the name and/or address of a place as users type.
  late Autocomplete autocomplete;

  /// [queryAutocomplete] provides a query prediction service for text-based geographic searches, returning suggested queries as users type.
  late QueryAutocomplete queryAutocomplete;

  /// [timeout] timeout for http call.
  static Duration timeout = Duration(milliseconds: 1500);

  /// Optional headers to pass on each request
  final Map<String, String> headers;

  /// Optional proxy url to web request
  /// Can be formatted as [https:// || http://]host[:<port>][/<path>][?<url-param-name>=]
  /// http proxies are supported, but are not recommended for production use.
  final String? proxyUrl;

  GooglePlace(
    this.apiKEY, {
    this.headers = const {},
    this.proxyUrl,
  }) {
    this.search = Search(apiKEY, headers, proxyUrl);
    this.details = Details(apiKEY, headers, proxyUrl);
    this.photos = Photos(apiKEY, headers, proxyUrl);
    this.autocomplete = Autocomplete(apiKEY, headers, proxyUrl);
    this.queryAutocomplete = QueryAutocomplete(apiKEY, headers, proxyUrl);
  }
}
