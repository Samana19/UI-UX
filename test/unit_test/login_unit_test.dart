import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/features/auth/domain/entity/user_entity.dart';
import 'package:the_daily_digest/features/auth/domain/use_case/auth_usecase.dart';
import 'package:the_daily_digest/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:dartz/dartz.dart';

import 'login_unit_test.mocks.dart';

@GenerateMocks([
  AuthUseCase,
  BuildContext,
])
void main() {
  late AuthViewModel authViewModel;
  late AuthUseCase mockAuthUseCase;
  late ProviderContainer container;
  late BuildContext mockBuildContext;

  setUpAll(
    () async {
      mockAuthUseCase = MockAuthUseCase();
      authViewModel = AuthViewModel(mockAuthUseCase);
      mockBuildContext = MockBuildContext();
      container = ProviderContainer(overrides: [
        authViewModelProvider.overrideWith(
          (ref) => AuthViewModel(mockAuthUseCase),
        )
      ]);
    },
  );

  tearDownAll(() {
    container.dispose();
  });

  test("initial state", () {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
    expect(authState.imageName, isNull);
  });

  test("login test with valid username and password", () async {
    when(mockAuthUseCase.loginUser('test', 'test')).thenAnswer(
      (_) async => const Right(true),
    );

    await authViewModel.loginUser(mockBuildContext, "test", "test");

    final authState = container.read(authViewModelProvider);
    expect(authState.error, isNull);
  });

  test("login test with invalid username and password", () async {
    when(mockAuthUseCase.loginUser("test1234", "test1234")).thenAnswer(
      (_) async => Left(Failure(error: 'Invalid')),
    );

    await authViewModel.loginUser(mockBuildContext, "test1234", "test1234");

    final authState = container.read(authViewModelProvider);
    expect(authState.error, isNull);
  });

  test("user not registered error", () async {
    final user = UserEntity(
      email: 'test@gmail.com',
      username: 'test',
      password: 'test',
    );
    final failure = Failure(error: 'User not registered');
    when(mockAuthUseCase.loginUser(user.username, user.password))
        .thenAnswer((_) async => Left(failure));

    await authViewModel.loginUser(
      mockBuildContext,
      user.username,
      user.password,
    );

    final authState = container.read(authViewModelProvider);
    expect(authState.error, isNull);
  });
}
