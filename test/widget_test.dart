import 'package:flutter_test/flutter_test.dart';
import 'package:punto_2/screens/punto2_screen.dart';

void main() {
  testWidgets('Renderiza la aplicación correctamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const Punto2());
    expect(find.text('Conversor Astronómico'), findsOneWidget);
  });
}
