import 'package:flutter_bloc_dr/feature/domain/entity/crypto_currency_response.dart';

abstract class CryptoState {
  const CryptoState({this.isHidden = true});

  final bool isHidden;
}

class CryptoInitState extends CryptoState {
  CryptoInitState() : super();
}

class CryptoLoadingState extends CryptoState {
  CryptoLoadingState() : super();
}

class CryptoLoadedState extends CryptoState {
  CryptoLoadedState(
      {required this.cryptoCurrencyResponse, required this.isHidden})
      : super(isHidden: isHidden);

  final CryptoCurrencyResponse cryptoCurrencyResponse;
  final bool isHidden;

  @override
  List<Object> get props => [isHidden];
}

class CryptoErrorState extends CryptoState {
  final String error;

  CryptoErrorState({required this.error}) : super();
}
