// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled21/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Flappy Ball Game Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(FlappyBallApp());

    // Verify that the initial score is 0.
    expect(find.text('Score: 0'), findsOneWidget);

    // Tap on the screen to start the game.
    await tester.tap(find.byType(Scaffold));
    await tester.pump();

    // Verify that the game has started and the score is still 0.
    expect(find.text('Score: 0'), findsOneWidget);

    // Wait for a moment to simulate gameplay.
    await tester.pump(Duration(seconds: 1));

    // Verify that the score is still 0 after a moment.
    expect(find.text('Score: 0'), findsOneWidget);

    // Tap on the screen to make the ball jump.
    await tester.tap(find.byType(Scaffold));
    await tester.pump();

    // Wait for a moment to simulate gameplay.
    await tester.pump(Duration(seconds: 1));

    // Verify that the score has increased.
    expect(find.text('Score: 1'), findsOneWidget);

    // Wait for a moment to simulate gameplay.
    await tester.pump(Duration(seconds: 1));

    // Verify that the score has not changed after hitting the barrier.
    expect(find.text('Score: 1'), findsOneWidget);

    // Tap on the screen to make the ball jump.
    await tester.tap(find.byType(Scaffold));
    await tester.pump();

    // Wait for a moment to simulate gameplay.
    await tester.pump(Duration(seconds: 1));

    // Verify that the score has increased.
    expect(find.text('Score: 2'), findsOneWidget);

    // Wait for a moment to simulate gameplay.
    await tester.pump(Duration(seconds: 1));

    // Verify that the score has not changed after hitting the barrier.
    expect(find.text('Score: 2'), findsOneWidget);

    // Tap on the screen to make the ball jump.
    await tester.tap(find.byType(Scaffold));
    await tester.pump();

    // Wait for a moment to simulate gameplay.
    await tester.pump(Duration(seconds: 1));

    // Verify that the score has increased.
    expect(find.text('Score: 3'), findsOneWidget);

    // Wait for a moment to simulate gameplay.
    await tester.pump(Duration(seconds: 1));

    // Verify that the score has not changed after hitting the barrier.
    expect(find.text('Score: 3'), findsOneWidget);
  });
}
