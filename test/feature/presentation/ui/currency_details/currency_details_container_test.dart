import 'package:flutter/material.dart';
import 'package:flutter_bloc_dr/feature/presentation/ui/home/widgets/currency_details/currency_details_container.dart';
import 'package:flutter_bloc_dr/feature/presentation/ui/home/widgets/currency_details/currency_details_row.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/home_cubit_data_helper.dart';

void main() {
  group('Contains currency detail test', () {
    testWidgets('Should contains currency detail.',
        (WidgetTester tester) async {
      await tester.pumpWidget(_TestWidget(
          child: CurrencyDetailsContainer(
              cryptoCurrencyResponse: cryptoCurrencyResponseData)));
      final String currency =
          cryptoCurrencyResponseData.cryptoCurrency?.currency ?? '';

      expect(find.text(currency), findsOneWidget);
      expect(find.byType(CurrencyDetailsRow), findsNWidgets(5));
      expect(find.byType(Column), findsNWidgets(6));
      expect(find.byType(Row), findsNWidgets(3));
    });
  });
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(home: child);
}
