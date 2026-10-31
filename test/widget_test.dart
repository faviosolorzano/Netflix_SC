import 'package:flutter_test/flutter_test.dart';

import 'package:netflix_sc/main.dart';

void main() {
  testWidgets('Muestra la pantalla de perfiles', (WidgetTester tester) async {
    await tester.pumpWidget(const NetflixApp());
    expect(find.text('¿Quién está viendo ahora?'), findsOneWidget);
  });
}
