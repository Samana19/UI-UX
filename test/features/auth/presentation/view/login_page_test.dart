import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_digest/config/router/approutes.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/features/auth/domain/use_case/auth_usecase.dart';
import 'package:the_daily_digest/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import '../../../../unit_test/login_unit_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<AuthUseCase>(),
  ],
)
void main() {
  late AuthUseCase mockAuthUseCase;
  late bool isLogin;

  setUpAll(() async {
    mockAuthUseCase = MockAuthUseCase();
    isLogin = true;
  });

  testWidgets('login test with username and password',
      (WidgetTester tester) async {
    when(mockAuthUseCase.loginUser('test123', 'test123'))
        .thenAnswer((_) async => Right(isLogin));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider
              .overrideWith((ref) => AuthViewModel(mockAuthUseCase)),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.loginRoute,
          routes: AppRoute.getAppRoutes(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).at(0), 'test123');
    await tester.enterText(find.byType(TextField).at(1), 'test123');

    await tester.tap(
      find.widgetWithText(GestureDetector, "Sign in"),
    );
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byType(TextField), findsNWidgets(1));
  });

  testWidgets('login test with username and incorrect password',
      (WidgetTester tester) async {
    when(mockAuthUseCase.loginUser('test123', 'test123'))
        .thenAnswer((_) async => Left(Failure(error: "Invalid")));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider
              .overrideWith((ref) => AuthViewModel(mockAuthUseCase)),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.loginRoute,
          routes: AppRoute.getAppRoutes(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).at(0), 'test123');
    await tester.enterText(find.byType(TextField).at(1), 'test123');

    await tester.tap(
      find.widgetWithText(GestureDetector, 'Sign in'),
    );

    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(
        find.widgetWithText(SnackBar, 'Invalid credentials'), findsOneWidget);
  });
}
