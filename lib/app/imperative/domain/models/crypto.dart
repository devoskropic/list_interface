class Crypto {
  final String id;
  final String symbol;
  final double price;

  Crypto({required this.id, required this.symbol, required this.price});

  // this enable us to make changes over the data
  Crypto copyWith({
    String? id,
    String? symbol,
    double? price,
  }) {
    return Crypto(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      price: price ?? this.price,
    );
  }

  // Since Dart allows only comparison between primitive types (String, double,
  // bool, int, enum, etc) and not over personalized classes instances
  // Para poder comparar 2 Crypto type instances we need to define equal operator
  // and this automatically ask us to override the hashcode

  @override
  bool operator ==(Object other) {
    if (other is Crypto) {
      return symbol == other.symbol && price == other.price && id == other.id;
    }
    return false;
  }

  @override
  int get hashCode => symbol.hashCode ^ price.hashCode ^ id.hashCode;
}
