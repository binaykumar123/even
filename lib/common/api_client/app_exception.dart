import 'package:flutter/material.dart';

class AppException implements Exception {
  final Object object;
  final int statusCode;

  AppException({
    @required this.object,
    this.statusCode,
  });
}
