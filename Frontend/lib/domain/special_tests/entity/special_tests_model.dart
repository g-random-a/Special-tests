class SpecialTest {
  final int id;
  final String name;
  final double price;
  final String description;
  final String category;
  final bool availablity;

  SpecialTest({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.availablity,
  });

  factory SpecialTest.fromJson(Map<String, dynamic> json) {
    return SpecialTest(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      availablity: json['availablity'],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['name'] = name;
    json['price'] = price;
    json['description'] = description;
    json['category'] = category;
    json['availablity'] = availablity;
    return json;
  }

  @override
  String toString() {
    return "id $id name $name";
  }
}
