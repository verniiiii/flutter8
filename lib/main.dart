import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/app_router.dart';
import 'core/transaction_inherited.dart';
import 'features/transactions/data/transaction_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = AppRouter().router;

  @override
  Widget build(BuildContext context) {
    final repository = TransactionRepository(); // Создание единственного экземпляра репозитория
    return TransactionInherited(
      repository: repository,
      child: MaterialApp.router(
        title: 'Financial Tracker',
        routerConfig: _router,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}