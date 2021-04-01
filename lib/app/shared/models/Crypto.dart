class Crypto {
  String symbol;
  String name;
  Metrics metrics;

  Crypto({this.symbol, this.name, this.metrics});

  Crypto.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    name = json['name'];
    metrics =
        json['metrics'] != null ? new Metrics.fromJson(json['metrics']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    if (this.metrics != null) {
      data['metrics'] = this.metrics.toJson();
    }
    return data;
  }
}

class Metrics {
  MarketData marketData;

  Metrics({this.marketData});

  Metrics.fromJson(Map<String, dynamic> json) {
    marketData = json['market_data'] != null
        ? new MarketData.fromJson(json['market_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.marketData != null) {
      data['market_data'] = this.marketData.toJson();
    }
    return data;
  }
}

class MarketData {
  num priceUsd;
  num priceBtc;
  num priceEth;
  num volumeLast24Hours;
  num realVolumeLast24Hours;
  num volumeLast24HoursOverstatementMultiple;
  num percentChangeUsdLast1Hour;
  num percentChangeUsdLast24Hours;
  num percentChangeBtcLast24Hours;
  num percentChangeEthLast24Hours;
  OhlcvLast1Hour ohlcvLast1Hour;
  OhlcvLast1Hour ohlcvLast24Hour;
  String lastTradeAt;

  MarketData(
      {this.priceUsd,
      this.priceBtc,
      this.priceEth,
      this.volumeLast24Hours,
      this.realVolumeLast24Hours,
      this.volumeLast24HoursOverstatementMultiple,
      this.percentChangeUsdLast1Hour,
      this.percentChangeUsdLast24Hours,
      this.percentChangeBtcLast24Hours,
      this.percentChangeEthLast24Hours,
      this.ohlcvLast1Hour,
      this.ohlcvLast24Hour,
      this.lastTradeAt});

  MarketData.fromJson(Map<String, dynamic> json) {
    priceUsd = json['price_usd'];
    priceBtc = json['price_btc'];
    priceEth = json['price_eth'];
    volumeLast24Hours = json['volume_last_24_hours'];
    realVolumeLast24Hours = json['real_volume_last_24_hours'];
    volumeLast24HoursOverstatementMultiple =
        json['volume_last_24_hours_overstatement_multiple'];
    percentChangeUsdLast1Hour = json['percent_change_usd_last_1_hour'];
    percentChangeUsdLast24Hours = json['percent_change_usd_last_24_hours'];
    percentChangeBtcLast24Hours = json['percent_change_btc_last_24_hours'];
    percentChangeEthLast24Hours = json['percent_change_eth_last_24_hours'];
    ohlcvLast1Hour = json['ohlcv_last_1_hour'] != null
        ? new OhlcvLast1Hour.fromJson(json['ohlcv_last_1_hour'])
        : null;
    ohlcvLast24Hour = json['ohlcv_last_24_hour'] != null
        ? new OhlcvLast1Hour.fromJson(json['ohlcv_last_24_hour'])
        : null;
    lastTradeAt = json['last_trade_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price_usd'] = this.priceUsd;
    data['price_btc'] = this.priceBtc;
    data['price_eth'] = this.priceEth;
    data['volume_last_24_hours'] = this.volumeLast24Hours;
    data['real_volume_last_24_hours'] = this.realVolumeLast24Hours;
    data['volume_last_24_hours_overstatement_multiple'] =
        this.volumeLast24HoursOverstatementMultiple;
    data['percent_change_usd_last_1_hour'] = this.percentChangeUsdLast1Hour;
    data['percent_change_usd_last_24_hours'] = this.percentChangeUsdLast24Hours;
    data['percent_change_btc_last_24_hours'] = this.percentChangeBtcLast24Hours;
    data['percent_change_eth_last_24_hours'] = this.percentChangeEthLast24Hours;
    if (this.ohlcvLast1Hour != null) {
      data['ohlcv_last_1_hour'] = this.ohlcvLast1Hour.toJson();
    }
    if (this.ohlcvLast24Hour != null) {
      data['ohlcv_last_24_hour'] = this.ohlcvLast24Hour.toJson();
    }
    data['last_trade_at'] = this.lastTradeAt;
    return data;
  }
}

class OhlcvLast1Hour {
  num open;
  num high;
  num low;
  num close;
  num volume;

  OhlcvLast1Hour({this.open, this.high, this.low, this.close, this.volume});

  OhlcvLast1Hour.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open'] = this.open;
    data['high'] = this.high;
    data['low'] = this.low;
    data['close'] = this.close;
    data['volume'] = this.volume;
    return data;
  }
}
