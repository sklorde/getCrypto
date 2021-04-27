class CryptoHistory {
  String priceUsd;
  int time;
  String date;

  CryptoHistory({this.priceUsd, this.time, this.date});

  CryptoHistory.fromJson(Map<String, dynamic> json) {
    priceUsd = json['priceUsd'];
    time = json['time'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['priceUsd'] = this.priceUsd;
    data['time'] = this.time;
    data['date'] = this.date;
    return data;
  }
}
