import 'package:flutter/material.dart';
import 'package:flutter_bloc_dr/feature/presentation/ui/home/widgets/currency_details/currency_details_row.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Currency detail row item test', () {
    const String titleName = 'open';
    const String data = '\$20428.19';
    testWidgets('Currency detail contains data to be show.',
        (WidgetTester tester) async {
      await tester.pumpWidget(const _TestWidget(
          child: CurrencyDetailsRow(titleName: titleName, data: data)));

      expect(find.text(titleName), findsOneWidget);
      expect(find.text(data), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });
  });
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(home: child);
}
