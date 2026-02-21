class AQIModel {
  final int aqi;
  final String city;
  final double temperature;

  AQIModel({required this.aqi, required this.city, required this.temperature});

  factory AQIModel.fromJson(Map<String, dynamic> json) {
    return AQIModel(
      aqi: json['data']['aqi'],
      city: json['data']['city']['name'],
      temperature: json['data']['iaqi']['t']['v']?.toDouble() ?? 0.0,
    );
  }
}
