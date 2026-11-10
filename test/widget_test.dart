import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:assignment34/main.dart';

void main() {
  testWidgets('loads the profile and supports details and attendance', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const StudentProfileApp());

    expect(find.byKey(const Key('profile-loading')), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 2300));
    await tester.pump();

    expect(find.text('Ariana Siddiqui'), findsOneWidget);
    expect(find.text('2024-01736'), findsOneWidget);
    expect(find.text('Computer Science'), findsOneWidget);

    await tester.ensureVisible(find.text('View Details'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('View Details'));
    await tester.pumpAndSettle();

    expect(find.text('Student details'), findsOneWidget);
    expect(find.text('Student Name'), findsOneWidget);
    expect(find.text('Student ID'), findsOneWidget);
    expect(find.text('Department'), findsOneWidget);

    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Mark Present'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mark Present'));
    await tester.pump();

    expect(find.text('Success! You are marked present.'), findsOneWidget);
  });
}
