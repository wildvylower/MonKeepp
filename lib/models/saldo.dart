class Saldo {
  final String wallet;
  final double balance;
  final double income;
  final double expense;
  final String icon;

  Saldo({
    required this.wallet,
    required this.balance,
    required this.income,
    required this.expense,
    required this.icon,
  });

  String get formattedBalance => "Rp ${balance.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (match) => "${match[1]}.")}";
  String get formattedIncome => "Rp ${income.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (match) => "${match[1]}.")}";
  String get formattedExpense => "Rp ${expense.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (match) => "${match[1]}.")}";
}

final List<Saldo> saldo = [
  Saldo(
    wallet: 'Gopay',
    balance: 100000,
    income: 475000,
    expense: 500000,
    icon: 'images/gopay.png',
  ),
  Saldo(
    wallet: 'Shopee Pay',
    balance: 450000,
    income: 475000,
    expense: 46000,
    icon: 'images/shopepay.png',
  ),
];
