import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:list_interface/app/functional/domain/models/crypto/crypto.dart';
import 'package:list_interface/app/functional/domain/response/imports.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.failed(HttpRequestFailure failure) = _Failed;
  const factory HomeState.loaded({
    required List<Crypto> cryptos,
    @Default(WsStatus.connecting()) WsStatus wsStatus,
  }) = _Loaded;
  const factory HomeState.singleLoaded({required List<Crypto> cryptos}) =
      _SingleLoaded;

  // factory HomeState.loading() = HomeStateLoading;
  // factory HomeState.failed() = HomeStateFailed;
  // factory HomeState.loaded(List<Crypto> cryptos) = HomeStateLoaded;
}

// dart run build_runner build