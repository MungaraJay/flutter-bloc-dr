import 'package:flutter_bloc_dr/feature/domain/entity/crypto_currency_response.dart';

abstract class CryptoState {
  const CryptoState();
}

class CryptoInitState extends CryptoState {
  CryptoInitState() : super();
}

class CryptoLoadingState extends CryptoState {
  CryptoLoadingState() : super();
}

class CryptoLoadedState extends CryptoState {
  CryptoLoadedState({required this.cryptoCurrencyResponse});

  final CryptoCurrencyResponse cryptoCurrencyResponse;

  @override
  List<Object> get props => [];
}

class CryptoErrorState extends CryptoState {
  final String error;

  CryptoErrorState({required this.error}) : super();
}
