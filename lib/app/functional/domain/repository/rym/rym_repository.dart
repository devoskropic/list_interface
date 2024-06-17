import 'package:list_interface/app/functional/domain/either/either.dart';
import 'package:list_interface/app/functional/domain/models/rick_morty/imports.dart';
import 'package:list_interface/app/functional/domain/response/http_request_failure.dart';

// typedef GetInfoFuture = Future<Either<HttpRequestFailure, List<Info>>>;

// typedef GetCharacter = Future<Either<HttpRequestFailure, List<Character>>>;
typedef GetCharacterById = Future<Either<HttpRequestFailure, List<Character>>>;
// typedef GetCharacterFilter
//     = Future<Either<HttpRequestFailure, List<Character>>>;

// typedef GetEpisode = Future<Either<HttpRequestFailure, List<Episode>>>;
// typedef GetEpisodeById = Future<Either<HttpRequestFailure, List<Episode>>>;
// typedef GetEpisodeFilter = Future<Either<HttpRequestFailure, List<Episode>>>;

// typedef GetLocation = Future<Either<HttpRequestFailure, List<Location>>>;
// typedef GetLocationById = Future<Either<HttpRequestFailure, List<Location>>>;
// typedef GetLocationFilter = Future<Either<HttpRequestFailure, List<Location>>>;

abstract class RickMortyRepository {
  // GetInfoFuture getInfo();

  // GetCharacter getCharacter();
  GetCharacterById getCharacterById(List<int> ids);
  // GetCharacterFilter getCharacterFilter();

  // GetEpisode getEpisode();
  // GetEpisodeById getEpisodeById(List<int> ids);
  // GetEpisodeFilter getEpisodeFilter();

  // GetLocation getLocation();
  // GetLocationById getLocationById(List<int> ids);
  // GetLocationFilter getLocationFilter();
}
