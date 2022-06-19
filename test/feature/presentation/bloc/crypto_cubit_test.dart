import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_dr/feature/domain/entity/crypto_currency_response.dart';
import 'package:flutter_bloc_dr/feature/domain/repository/crypto_repository.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/crypto/crypto_cubit.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/crypto/crypto_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/home_cubit_data_helper.dart';

class MockCryptoRepository extends Mock implements CryptoRepository {}

class MockCryptoCubit extends MockCubit<CryptoState> implements CryptoCubit {}

void main() {
  late CryptoCubit cryptoCubit;
  late CryptoRepository cryptoRepository;

  setUpAll(() {
    cryptoCubit = MockCryptoCubit();
    cryptoRepository = MockCryptoRepository();
  });

  group('Crypto cubit test =>', () {
    test('Should fetch btcusd conversion', () async {
      whenListen(
        cryptoCubit,
        Stream<CryptoState>.fromIterable(
          <CryptoState>[
            CryptoLoadingState(),
            CryptoLoadedState(
                cryptoCurrencyResponse: cryptoCurrencyResponseData,
                isHidden: true),
          ],
        ),
      );

      await expectLater(
        cryptoCubit.stream,
        emitsInOrder(
          <dynamic>[
            isA<CryptoLoadingState>(),
            isA<CryptoLoadedState>(),
          ],
        ),
      );
      expect(cryptoCubit.state, isA<CryptoLoadedState>());

      final CryptoLoadedState currentState =
          cryptoCubit.state as CryptoLoadedState;
      expect(currentState.cryptoCurrencyResponse, isNotNull);
      expect(
          currentState.cryptoCurrencyResponse, isA<CryptoCurrencyResponse>());
      expect(currentState.isHidden, isNotNull);
      expect(currentState.isHidden, isA<bool>());
    });

    final Exception exception = Exception('Crypto cubit exception.');

    blocTest<CryptoCubit, CryptoState>(
      'Captures exception for crypto cubit test.',
      build: () => CryptoCubit(cryptoRepository),
      act: (CryptoCubit cubit) => cubit.addError(exception),
      errors: () => <Matcher>[equals(exception)],
    );
  });
}
