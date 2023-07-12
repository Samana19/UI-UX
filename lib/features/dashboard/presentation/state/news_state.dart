import 'package:flutter/material.dart';
import 'package:the_daily_digest/features/dashboard/domain/entity/news_entity.dart';

class NewsState {
  final bool isLoading;
  final List<NewsEntity> news;
  final String? error;

  NewsState({
    required this.isLoading,
    required this.news,
    this.error,
  });

  factory NewsState.initial() {
    return NewsState(
      isLoading: false,
      news: [],
    );
  }

  bool get hasError => error != null;
  List<NewsEntity> get data => news;

  NewsState copyWith({
    bool? isLoading,
    List<NewsEntity>? news,
    String? error,
  }) {
    return NewsState(
      isLoading: isLoading ?? this.isLoading,
      news: news ?? this.news,
      error: error ?? this.error,
    );
  }
}
