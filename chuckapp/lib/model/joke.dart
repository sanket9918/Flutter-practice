class Joke {
  String id;
  String iconUrl;
  String url;
  String value;

  Joke(this.id, this.iconUrl, this.url, this.value);

  Joke.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        iconUrl = json['icon_url'],
        url = json['url'],
        value = json['value'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'icon_url': iconUrl, 'url': url, 'value': value};
}
