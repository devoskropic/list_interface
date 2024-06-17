import 'package:flutter/material.dart';
import 'package:list_interface/app/functional/domain/response/imports.dart';

class ErrorHttp extends StatelessWidget {
  final HttpRequestFailure failure;

  const ErrorHttp({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    final msg = failure.whenOrNull(
      network: () => "Network error",
      notFound: () => "Error: data not found",
      server: () => "Server Error",
      unauthorized: () => "Unauthorized access",
      badRequest: () => "Error: bad request",
      local: () => "Unknown error",
    );
    return Center(
      child: Text(msg!),
    );
  }
}
