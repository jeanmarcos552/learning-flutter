class Transaction {
  final int id;
  final String name;
  final double value;
  final DateTime date;

  Transaction({
    required this.id,
    required this.name,
    required this.date,
    required this.value,
  });
}
