import 'package:list_interface/app/functional/data/services/rick_morty_api.dart';
import 'package:list_interface/app/functional/domain/repository/rym/rym_repository.dart';

class RymRepositoryImpl implements RickMortyRepository {
  final RickMortyAPI _api;

  RymRepositoryImpl(this._api);

  @override
  GetCharacterById getCharacterById(List<int> ids) {
    return _api.getCharacterById(ids);
  }
}
