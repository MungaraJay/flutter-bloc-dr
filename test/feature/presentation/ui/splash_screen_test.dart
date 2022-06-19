import 'package:flutter/material.dart';
import 'package:flutter_bloc_dr/feature/presentation/ui/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Order book item title tests', () {
    testWidgets('Should contains order book item title widget.',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(const _TestWidget(child: SplashScreen()));

        expect(find.byType(Scaffold), findsOneWidget);
        expect(find.byType(FlutterLogo), findsOneWidget);
      });
    });
  });
}

class _TestWidget extends StatelessWidget {
  const _TestWidget({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(home: child);
}
