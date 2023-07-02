import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_digest/config/router/approutes.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/features/auth/domain/entity/user_entity.dart';
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
  late UserEntity userEntity;
  setUpAll(() async {
    mockAuthUseCase = MockAuthUseCase();
    userEntity = UserEntity(
      username: 'test',
      email: 'test@gmail.com',
      password: 'test',
    );
  });

  testWidgets('register users successfully', (tester) async {
    when(mockAuthUseCase.registerUser(userEntity))
        .thenAnswer((_) async => const Right(true));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider
              .overrideWith((ref) => AuthViewModel(mockAuthUseCase)),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.signupRoute,
          routes: AppRoute.getAppRoutes(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), 'test');
    await tester.enterText(find.byType(TextField).at(1), 'test@gmail.com');
    await tester.enterText(find.byType(TextField).at(2), 'test');

    await tester.tap(
      find.widgetWithText(GestureDetector, 'Sign Up'),
    );

    await tester.pumpAndSettle();

    expect(find.widgetWithText(SnackBar, 'Successfully registered'),
        findsOneWidget);
  });

  testWidgets('register users with invalid credentials', (tester) async {
    when(mockAuthUseCase.registerUser(userEntity))
        .thenAnswer((_) async => Left(Failure(error: "invalid")));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authViewModelProvider
              .overrideWith((ref) => AuthViewModel(mockAuthUseCase)),
        ],
        child: MaterialApp(
          initialRoute: AppRoute.signupRoute,
          routes: AppRoute.getAppRoutes(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), 'test');
    await tester.enterText(find.byType(TextField).at(1), 'test@gmail.com');
    await tester.enterText(find.byType(TextField).at(2), 'test');

    await tester.tap(
      find.widgetWithText(GestureDetector, 'Sign Up'),
    );

    await tester.pumpAndSettle();

    expect(find.widgetWithText(SnackBar, 'Please enter valid information'),
        findsOneWidget);
  });
}
