import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_daily_digest/core/failure/failure.dart';
import 'package:the_daily_digest/features/auth/domain/entity/user_entity.dart';
import 'package:the_daily_digest/features/auth/domain/use_case/auth_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:the_daily_digest/features/auth/presentation/viewmodel/auth_viewmodel.dart';

import 'signup_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late AuthUseCase mockAuthUseCase;
  late BuildContext context;
  late ProviderContainer container;

  setUp(() async {
    mockAuthUseCase = MockAuthUseCase();
    context = MockBuildContext();
    container = ProviderContainer(overrides: [
      authViewModelProvider
          .overrideWith((ref) => AuthViewModel(mockAuthUseCase)),
    ]);
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state', () async {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
    expect(authState.imageName, isNull);
  });

  test('register user test', () async {
    final user = UserEntity(
      email: 'test@gmail.com',
      username: 'test',
      password: 'test',
    );
    when(mockAuthUseCase.registerUser(user))
        .thenAnswer((_) async => const Right(true));
    await container.read(authViewModelProvider.notifier).registerUser(context,user);
    final authState = container.read(authViewModelProvider);
    expect(authState.error, isNull);
  });

  test('register user failure test', () async {
    // Arrange
    final user = UserEntity(
      email: 'test@gmail.com',
      username: 'test',
      password: 'test',
    );
    final failure = Failure(error: 'Registration Failed');
    when(mockAuthUseCase.registerUser(user))
        .thenAnswer((_) async => Left(failure));

    // Act
    await container.read(authViewModelProvider.notifier).registerUser(context,user);

    // Assert
    final authState = container.read(authViewModelProvider);
    expect(authState.error, isNotNull);
  });

  test("incorrect email error while registering user", () async {
    final user = UserEntity(
      email: 'bdhsbahbbvdfvfd',
      username: 'test',
      password: 'test',
    );
    final failure = Failure(error: 'Invalid email');
    when(mockAuthUseCase.registerUser(user))
        .thenAnswer((_) async => Left(failure));
    await container.read(authViewModelProvider.notifier).registerUser(context,user);
    final authState = container.read(authViewModelProvider);
    expect(authState.error, equals('Invalid email'));
  });
}
