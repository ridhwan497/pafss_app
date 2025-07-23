import 'package:socket_io_client/socket_io_client.dart' as IO;

class SignalingService {
  late IO.Socket _socket;
  final String serverUrl;

  SignalingService({required this.serverUrl});

  void connect(int userId) {
    _socket = IO.io(serverUrl, <String, dynamic>{
      'transports': ['websocket'],
    });
    _socket.on('connect', (_) {
      _socket.emit('register', userId);
    });
  }

  void onOffer(void Function(Map<String, dynamic>) handler) {
    _socket.on('offer', (data) => handler(data));
  }

  void onAnswer(void Function(Map<String, dynamic>) handler) {
    _socket.on('answer', (data) => handler(data));
  }

  void onIceCandidate(void Function(Map<String, dynamic>) handler) {
    _socket.on('ice-candidate', (data) => handler(data));
  }

  void sendOffer(int targetId, Map<String, dynamic> offer) {
    _socket.emit('offer', {'targetId': targetId, 'offer': offer});
  }

  void sendAnswer(int targetId, Map<String, dynamic> answer) {
    _socket.emit('answer', {'targetId': targetId, 'answer': answer});
  }

  void sendIceCandidate(int targetId, Map<String, dynamic> candidate) {
    _socket.emit('ice-candidate', {'targetId': targetId, 'candidate': candidate});
  }
}
