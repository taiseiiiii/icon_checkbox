import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:icon_checkbox/icon_checkbox.dart';

void main() {

  group('IconCheckbox_base', () { 
    testWidgets('IconCheckbox_Base_action_currently', (WidgetTester tester) async {
      bool isChecked = false;
      const defaultCheckColor = Colors.blue;
      const defaultUnCheckColor = Colors.grey;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              uncheckedIcon: Icons.lightbulb_outline_rounded,
              value: isChecked,
              onChanged: (value) {
                isChecked = value;
              },
            ),
          ),
        ),
      );

      // Verify initial state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);// チェックアイコンの色の確認
      final Icon unCheckIcon = tester.widget<Icon>(find.byIcon(Icons.lightbulb_outline_rounded));
      expect(unCheckIcon.color, equals(defaultUnCheckColor));

      // Tap the checkbox
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, true);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
      final Icon checkIcon = tester.widget<Icon>(find.byIcon(Icons.lightbulb_outline));
      expect(checkIcon.color, equals(defaultCheckColor));

      // Tap the checkbox again
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      expect(unCheckIcon.color, equals(defaultUnCheckColor));
    });
  });

  group('IconCheckbox_checkColor', () {
    testWidgets('IconCheckbox_change_checkColor', (WidgetTester tester) async {
      bool isChecked = false;
      const testColor = Colors.red;
      const defaultUnCheckColor = Colors.grey;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              uncheckedIcon: Icons.lightbulb_outline_rounded,
              value: isChecked,
              checkColor: Colors.red,
              onChanged: (value) {
                isChecked = value;
              },
            )
          ),
        )
      );

      // Verify initial state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);// チェックアイコンの色の確認
      final Icon unCheckIcon = tester.widget<Icon>(find.byIcon(Icons.lightbulb_outline_rounded));
      expect(unCheckIcon.color, equals(defaultUnCheckColor));

      // Tap the checkbox
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, true);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
      final Icon checkIcon = tester.widget<Icon>(find.byIcon(Icons.lightbulb_outline));
      expect(checkIcon.color, equals(testColor));

      // Tap the checkbox again
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      expect(unCheckIcon.color, equals(defaultUnCheckColor));
    });
  });
  
  group('IconCheckbox_unCheckColor', () {
    testWidgets('IconCheckbox_change_unCheckColor', (WidgetTester tester) async {
      bool isChecked = false;
      const defaultCheckColor = Colors.blue;
      const testColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              uncheckedIcon: Icons.lightbulb_outline_rounded,
              value: isChecked,
              unCheckColor: Colors.red,
              onChanged: (value) {
                isChecked = value;
              },
            )
          ),
        )
      );

      // Verify initial state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      final Icon unCheckIcon = tester.widget<Icon>(find.byIcon(Icons.lightbulb_outline_rounded));
      expect(unCheckIcon.color, equals(testColor));

      // Tap the checkbox
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, true);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
      final Icon checkIcon = tester.widget<Icon>(find.byIcon(Icons.lightbulb_outline));
      expect(checkIcon.color, equals(defaultCheckColor));

      // Tap the checkbox again
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      expect(unCheckIcon.color, equals(testColor));
    });
  });
  
  group('IconCheckbox_boxdecoration', () {
    testWidgets('IconCheckbox_change_boxdecoration', (WidgetTester tester) async {
      bool isChecked = false;
      final decoration = BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              uncheckedIcon: Icons.lightbulb_outline_rounded,
              value: isChecked,
              onChanged: (value) {
                isChecked = value;
              },
              boxdecoration: decoration,
            )
          ),
        )
      );

      // Verify initial state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);
      expect(containerWidget.decoration, equals(decoration));
      expect(
        find.descendant(
          of: containerFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );

      // Tap the checkbox
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      expect(isChecked, true);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
      expect(containerWidget.decoration, equals(decoration));
      expect(
        find.descendant(
          of: containerFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );

      // Tap the checkbox again
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      expect(containerWidget.decoration, equals(decoration));
      expect(
        find.descendant(
          of: containerFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );
    });
  });

  group('IconCheckbox_boxHeight', () {
    testWidgets('IconCheckbox_change_boxHeight', (WidgetTester tester) async {
      bool isChecked = false;
      const boxHeight = 100.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              uncheckedIcon: Icons.lightbulb_outline_rounded,
              value: isChecked,
              onChanged: (value) {
                isChecked = value;
              },
              boxHeight: boxHeight,
            )
          ),
        )
      );

      // Verify initial state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);
      expect(containerWidget.constraints!.maxHeight, equals(boxHeight));
      expect(
        find.descendant(
          of: containerFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );

      // Tap the checkbox
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      expect(isChecked, true);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
      expect(containerWidget.constraints!.maxHeight, equals(boxHeight));
      expect(
        find.descendant(
          of: containerFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );

      // Tap the checkbox again
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      expect(containerWidget.constraints!.maxHeight, equals(boxHeight));
      expect(
        find.descendant(
          of: containerFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );
    });
  });

  group('IconCheckbox_boxWidth', () {
    testWidgets('IconCheckbox_change_boxWidth', (WidgetTester tester) async {
      bool isChecked = false;
      const boxWidth = 100.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              uncheckedIcon: Icons.lightbulb_outline_rounded,
              value: isChecked,
              onChanged: (value) {
                isChecked = value;
              },
              boxWidth: boxWidth,
            )
          ),
        )
      );

      // Verify initial state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);
      expect(containerWidget.constraints!.maxWidth, equals(boxWidth));
      expect(
        find.descendant(
          of: containerFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );

      // Tap the checkbox
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      expect(isChecked, true);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
      expect(containerWidget.constraints!.maxWidth, equals(boxWidth));
      expect(
        find.descendant(
          of: containerFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );

      // Tap the checkbox again
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      expect(containerWidget.constraints!.maxWidth, equals(boxWidth));
      expect(
        find.descendant(
          of: containerFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );
    });
  });

  group('IconCheckbox_iconSize', () { 
    testWidgets('IconCheckbox_iconSize', (WidgetTester tester) async {
      bool isChecked = false;
      const iconSize = 50.0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              uncheckedIcon: Icons.lightbulb_outline_rounded,
              value: isChecked,
              onChanged: (value) {
                isChecked = value;
              },
              iconSize: iconSize,
            )
          ),
        )
      );

      // Verify initial state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      final Icon unCheckIcon = tester.widget<Icon>(find.byIcon(Icons.lightbulb_outline_rounded));
      expect(unCheckIcon.size, equals(iconSize));

      // Tap the checkbox
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, true);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
      final Icon checkIcon = tester.widget<Icon>(find.byIcon(Icons.lightbulb_outline));
      expect(checkIcon.size, equals(iconSize));

      // Tap the checkbox again
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      expect(unCheckIcon.size, equals(iconSize));
    });
  });

  group('IconCheckbox_all_args', () {
    testWidgets('IconCheckbox_all_args', (WidgetTester tester) async {
      bool isChecked = false;
      const testCheckColor = Colors.red;
      const testUnCheckColor = Colors.yellow;
      const iconSize = 50.0;
      const boxHeight = 100.0;
      const boxWidth = 100.0;
      final decoration = BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IconCheckbox(
              checkedIcon: Icons.lightbulb_outline,
              uncheckedIcon: Icons.lightbulb_outline_rounded,
              value: isChecked,
              onChanged: (value) {
                isChecked = value;
              },
              checkColor: testCheckColor,
              unCheckColor: testUnCheckColor,
              iconSize: iconSize,
              boxdecoration: decoration,
              boxHeight: boxHeight,
              boxWidth: boxWidth,
            )
          ),
        )
      );

      // Verify initial state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      final Icon unCheckIcon = tester.widget<Icon>(find.byIcon(Icons.lightbulb_outline_rounded));
      expect(unCheckIcon.color, equals(testUnCheckColor));
      expect(unCheckIcon.size, equals(iconSize));
      final containerFinder = find.byType(Container);
      final containerWidget = tester.widget<Container>(containerFinder);
      expect(containerWidget.decoration, equals(decoration));
      expect(containerWidget.constraints!.maxHeight, equals(boxHeight));
      expect(containerWidget.constraints!.maxWidth, equals(boxWidth));
      expect(
        find.descendant(
          of: containerFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );

      // Tap the checkbox
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, true);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
      final Icon checkIcon = tester.widget<Icon>(find.byIcon(Icons.lightbulb_outline));
      expect(checkIcon.color, equals(testCheckColor));
      expect(checkIcon.size, equals(iconSize));
      expect(containerWidget.decoration, equals(decoration));
      expect(containerWidget.constraints!.maxHeight, equals(boxHeight));
      expect(containerWidget.constraints!.maxWidth, equals(boxWidth));
      expect(
        find.descendant(
          of: containerFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );

      // Tap the checkbox again
      await tester.tap(find.byType(IconCheckbox));
      await tester.pump();

      // Verify updated state
      expect(isChecked, false);
      expect(find.byIcon(Icons.lightbulb_outline), findsNothing);
      expect(find.byIcon(Icons.lightbulb_outline_rounded), findsOneWidget);
      expect(unCheckIcon.color, equals(testUnCheckColor));
      expect(unCheckIcon.size, equals(iconSize));
      expect(containerWidget.decoration, equals(decoration));
      expect(containerWidget.constraints!.maxHeight, equals(boxHeight));
      expect(containerWidget.constraints!.maxWidth, equals(boxWidth));
      expect(
        find.descendant(
          of: containerFinder,
          matching: find.byType(Icon),
        ),
        findsOneWidget,
      );
    });
  });

  group('IconCheckbox_error', () {
    bool isChecked = false;
    testWidgets('unCheckColor and boxdecoration null', (WidgetTester tester) async {
      runZonedGuarded(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: IconCheckbox(
                checkedIcon: Icons.lightbulb_outline,
                value: isChecked,
                onChanged: (value) {
                  isChecked = value;
                },
              ),
            ),
          ),
        );
        fail('No error was thrown');
      }, (error, stackTrace) {
        expect(error.toString(), contains('checkedIcon and boxdecoration cannot be both null'));
      });
    });
  });
}
