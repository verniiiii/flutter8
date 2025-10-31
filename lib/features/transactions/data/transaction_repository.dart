import 'package:prac8/features/transactions/data/transaction_model.dart';
import 'package:prac8/core/constants/categories.dart';

class TransactionRepository {
  final List<Transaction> transactions = [];

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  void updateTransaction(String id, Transaction updatedTransaction) {
    final index = transactions.indexWhere((transaction) => transaction.id == id);
    if (index != -1) {
      transactions[index] = Transaction(
        id: id,
        title: updatedTransaction.title,
        description: updatedTransaction.description,
        amount: updatedTransaction.amount,
        createdAt: transactions[index].createdAt,
        type: updatedTransaction.type,
        category: updatedTransaction.category,
      );
    }
  }

  void deleteTransaction(String id) {
    transactions.removeWhere((transaction) => transaction.id == id);
  }

  void toggleTransactionType(String id) {
    final index = transactions.indexWhere((transaction) => transaction.id == id);
    if (index != -1) {
      transactions[index] = Transaction(
        id: transactions[index].id,
        title: transactions[index].title,
        description: transactions[index].description,
        amount: transactions[index].amount,
        createdAt: transactions[index].createdAt,
        type: transactions[index].isExpense ? TransactionType.income : TransactionType.expense,
        category: transactions[index].category,
      );
    }
  }

  double getTotalIncome() {
    return transactions
        .where((transaction) => transaction.isIncome)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  double getTotalExpenses() {
    return transactions
        .where((transaction) => transaction.isExpense)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  double getBalance() {
    return getTotalIncome() - getTotalExpenses();
  }
}