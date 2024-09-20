import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trophy/Screens/Authentication.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trophy/Screens/ResetPassword.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
  });

  Future<void> pumpAuthPage(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthPage())); // Keep this if AuthPage has no parameters
  }

  testWidgets("should toggle password visibility", (WidgetTester tester) async {
    await pumpAuthPage(tester);

    // Initial state should have the password obscured
    expect(tester.widget<TextField>(find.byKey(Key("password"))).obscureText, isTrue);

    // Tap the visibility toggle
    await tester.tap(find.byIcon(Icons.visibility_off));
    await tester.pump();

    // Now the password should be visible
    expect(tester.widget<TextField>(find.byKey(Key("password"))).obscureText, isFalse);
  });

  testWidgets("should insert valid username and password", (WidgetTester tester) async {
    await pumpAuthPage(tester);

    // Enter valid username and password
    await tester.enterText(find.byKey(Key("username")), "valid_username");
    await tester.enterText(find.byKey(Key("password")), "valid_password");

    // Verify that the values have been inserted correctly
    expect(find.text("valid_username"), findsOneWidget);
    expect(find.text("valid_password"), findsOneWidget); // This will not work for obscured text; see below
  });

  testWidgets("should show error dialog on invalid username", (WidgetTester tester) async {
    // Simulate the login failure directly in the widget
    await pumpAuthPage(tester);

    // Enter an invalid username and a valid password
    await tester.enterText(find.byKey(Key("username")), "invalid_username");
    await tester.enterText(find.byKey(Key("password")), "valid_password");

    // Tap the login button
    await tester.tap(find.byKey(Key("loginbtn")));
    await tester.pumpAndSettle();

    // Check for the error dialog
    expect(find.text('Login failed. Please check your credentials or try again later.'), findsOneWidget);
  });

  testWidgets("should show error dialog on invalid password", (WidgetTester tester) async {
    await pumpAuthPage(tester);

    // Enter a valid username and an invalid password
    await tester.enterText(find.byKey(Key("username")), "valid_username");
    await tester.enterText(find.byKey(Key("password")), "invalid_password");

    // Tap the login button
    await tester.tap(find.byKey(Key("loginbtn")));
    await tester.pumpAndSettle();

    // Check for the error dialog
    expect(find.text('Login failed. Please check your credentials or try again later.'), findsOneWidget);
  });

  testWidgets("should show error dialog on both invalid username and password", (WidgetTester tester) async {
    await pumpAuthPage(tester);

    // Enter invalid username and password
    await tester.enterText(find.byKey(Key("username")), "invalid_username");
    await tester.enterText(find.byKey(Key("password")), "invalid_password");

    // Tap the login button
    await tester.tap(find.byKey(Key("loginbtn")));
    await tester.pumpAndSettle();

    // Check for the error dialog
    expect(find.text('Login failed. Please check your credentials or try again later.'), findsOneWidget);
  });



}
