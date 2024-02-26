class ShoppingItemModel {
  // 이름
  final String name;

  // 갯수
  final int quantity;

  // 구매 했는지
  final bool hasBought;

  // 매운지
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });

  ShoppingItemModel copyWith({
    String? name = null,
    int? quantity = null,
    bool? hasBought = null,
    bool? isSpicy = null,
  }) {
    return ShoppingItemModel(
      name:  name ?? this.name,
      quantity: quantity?? this.quantity,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
    );
  }
}
