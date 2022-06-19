import 'package:flutter/material.dart';
import 'package:flutter_bloc_dr/feature/presentation/ui/home/widgets/order_book/order_book_item_title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Order book item title tests', () {
    const String header1 = 'BID PRICE';
    const String header2 = 'QTY';
    const String header3 = 'ASK PRICE';

    testWidgets('Should contains order book item title widget.',
        (WidgetTester tester) async {
      await tester.pumpWidget(const _TestWidget(child: OrderBookItemTitle()));

      expect(find.text(header2), findsNWidgets(2));
      expect(find.text(header3), findsOneWidget);
      expect(find.text(header1), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(4));
    });
  });
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(home: child);
}
