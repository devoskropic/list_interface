String baseURL = 'https://api.coincap.io/v2/assets';
String baseURL2 = 'https://api.coincap.io/v2/assets?ids=';

String wsConn = 'wss://ws.coincap.io/prices';
String wsConn2 = 'wss://ws.coincap.io/prices?assets=';

List<String> shortList = [
  'bitcoin',
  'ethereum',
  'litecoin',
  'shiba-inu',
  'cardano',
  'dogecoin',
  'usd-coin',
];

String baseURL3 = 'https://api.coincap.io/v2/assets?ids=${shortList.join(',')}';

String wsConn3 = 'wss://ws.coincap.io/prices?assets=${shortList.join(',')}';
String wsConn4 = 'wss://ws.coincap.io/prices?assets=ALL';
