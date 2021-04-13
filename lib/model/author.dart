
import 'dart:convert';

Author authorFromJson(String str) => Author.fromJson(json.decode(str));
String authorToJson(Author data) => json.encode(data.toJson());

class Author {

  int authorId;
  String authorName;
  String authorDescription;


	Author();

  Author.withParam(this.authorId, this.authorName, this.authorDescription);

  Author.fromJson(Map<String, dynamic> map):
		authorId = map["authorId"],
		authorName = map["authorName"],
		authorDescription = map["authorDescription"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['authorId'] = authorId;
		data['authorName'] = authorName;
		data['authorDescription'] = authorDescription;
		return data;
	}
}
