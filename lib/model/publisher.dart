

import 'dart:convert';

Publisher publisherFromJson(String str) => Publisher.fromJson(json.decode(str));
String publisherToJson(Publisher data) => json.encode(data.toJson());

class Publisher {

  int publisherId;
  String publisherName;
  String publisherDescription;


	Publisher();

  Publisher.withParam(this.publisherId, this.publisherName, this.publisherDescription);

  Publisher.fromJson(Map<String, dynamic> map):
		publisherId = map["publisherId"],
		publisherName = map["publisherName"],
		publisherDescription = map["publisherDescription"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['publisherId'] = publisherId;
		data['publisherName'] = publisherName;
		data['publisherDescription'] = publisherDescription;
		return data;
	}
}
