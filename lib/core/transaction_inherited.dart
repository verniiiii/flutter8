import 'package:flutter/material.dart';
import '../features/transactions/data/transaction_repository.dart';

class TransactionInherited extends InheritedWidget {
  final TransactionRepository repository;

  const TransactionInherited({
    super.key,
    required this.repository,
    required super.child,
  });

  static TransactionInherited of(BuildContext context) {
    final TransactionInherited? result =
    context.dependOnInheritedWidgetOfExactType<TransactionInherited>();
    assert(result != null, 'No TransactionInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TransactionInherited oldWidget) {
    return false;
  }
}