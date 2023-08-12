import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_daily_digest/features/dashboard/presentation/view/bottom_view/dashboard/dashboard_page.dart';

void main() {
  testWidgets('DashboardPage - Initial UI', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: DashboardPage(),
      ),
    );

    // Verify the presence of the search bar
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(Image), findsNWidgets(2));
  });

  testWidgets('DashboardPage - Select Category', (tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: DashboardPage(),
      ),
    );

    await tester.pumpAndSettle();
    // Tap on the second category
    await tester.tap(find.text('Category 2'));
    await tester.pump();

    // Verify the selected category has a CircleAvatar
    expect(find.byType(CircleAvatar), findsOneWidget);
  });
}
