/// token : "ZIGsbYXmzk2EjCRZ3BFT43HnxGrUe3MZOWmJAvFOH4WbRIgp2yYk2fPT5nypwrDpsohkKxYGDrwWNX0gZxENXRs0OYL6v1kBzjxJOI12mwJakHRJYkqnFIXe"
/// zone_wise_topic : "zone_1_delivery_man"

class TokenModel {
  TokenModel({
      String? token, 
      String? zoneWiseTopic,}){
    _token = token;
    _zoneWiseTopic = zoneWiseTopic;
}

  TokenModel.fromJson(dynamic json) {
    _token = json['token'];
    _zoneWiseTopic = json['zone_wise_topic'];
  }
  String? _token;
  String? _zoneWiseTopic;
TokenModel copyWith({  String? token,
  String? zoneWiseTopic,
}) => TokenModel(  token: token ?? _token,
  zoneWiseTopic: zoneWiseTopic ?? _zoneWiseTopic,
);
  String? get token => _token;
  String? get zoneWiseTopic => _zoneWiseTopic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['zone_wise_topic'] = _zoneWiseTopic;
    return map;
  }

}