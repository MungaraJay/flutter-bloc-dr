import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dr/feature/domain/entity/crypto_currency_response.dart';
import 'package:flutter_bloc_dr/feature/domain/repository/crypto_repository.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/crypto/crypto_state.dart';

class CryptoCubit extends Cubit<CryptoState> {
  final CryptoRepository _cryptoRepository;

  CryptoCubit(this._cryptoRepository) : super(CryptoInitState());

  Future<void> fetchCryptoCurrency(String currency) async {
    try {
      emit(CryptoLoadingState());
      CryptoCurrencyResponse cryptoCurrencyResponse = await _cryptoRepository
          .fetchCryptoCurrencyConversion(currency: currency);

      emit(CryptoLoadedState(
          cryptoCurrencyResponse: cryptoCurrencyResponse, isHidden: true));
    } catch (e) {
      emit(CryptoErrorState(error: e.toString()));
    }
  }

  Future<void> toggleOrderBook(
      CryptoCurrencyResponse cryptoCurrencyResponse, bool isHidden) async {
    emit(CryptoLoadedState(
        cryptoCurrencyResponse: cryptoCurrencyResponse, isHidden: isHidden));
  }
}
