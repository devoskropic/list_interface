import 'package:list_interface/app/imperative/domain/models/crypto.dart';

abstract class HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateFailed extends HomeState {}

class HomeStateLoaded extends HomeState {
  final List<Crypto> cryptos;

  HomeStateLoaded(this.cryptos);
}
