class Client {
  final String clientId;
  final String fristName;
  final String lastName;
  final int age;
  final String gender;
  final String medicalInfo;

  static final List<String> clientFields = [
    'client_id',
    'frist_name',
    'last_name',
    'age',
    'gender',
    'medical_info',
  ];

  Client({
    required this.clientId,
    required this.fristName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.medicalInfo,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
        clientId: json['client_id'],
        fristName: json['fristName'],
        lastName: json['lastName'],
        age: json['age'],
        gender: json['gender'],
        medicalInfo: json['medicalInfo']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['client_id'] = clientId;
    json['fristName'] = fristName;
    json['lastName'] = lastName;
    json['age'] = age;
    json['gender'] = gender;
    json['medicalInfo'] = medicalInfo;
    return json;
  }

  @override
  String toString() {
    return "client id $clientId, name $fristName $lastName";
  }
}
