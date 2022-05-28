
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';

class Hospital {
  String hospId;
  String name;
  String description;
  double rating;
  int ratedClients;
  String address;
  String image;
  int requestedTimes;
  List<SpecialTest> specialTest;

  static final List<String> hospitalFields = [
    'hosp_id',
    'name',
    'description',
    'rating',
    'rated_clients',
    'address',
    'image',
    'requestedTimes'
  ];

  Hospital({
    required this.hospId,
    required this.name,
    required this.description,
    required this.rating,
    required this.ratedClients,
    required this.address,
    required this.image,
    required this.requestedTimes,
    required this.specialTest,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
        hospId: json['hosp_id'],
        name: json['name'],
        description: json['description'],
        rating: json['rating'],
        ratedClients: json['ratedClients'],
        address: json['address'],
        image: json['image'],
        requestedTimes: json['requestedTimes'],
        specialTest: json['specialTests']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['hosp_id'] = hospId;
    json['name'] = name;
    json['description'] = description;
    json['rating'] = rating;
    json['ratedClients'] = ratedClients;
    json['address'] = address;
    json['image'] = image;
    json['requestedTimes'] = requestedTimes;
    return json;
  }

  @override
  String toString() {
    return "client id $hospId, name $name";
  }
}
