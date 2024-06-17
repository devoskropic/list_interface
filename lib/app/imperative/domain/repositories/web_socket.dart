abstract class WebSocketRepository {
  Future<bool> connect();
  Future<void> disconnect();
}
