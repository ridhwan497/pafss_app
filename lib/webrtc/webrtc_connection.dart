import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class WebRTCConnection {
  late RTCPeerConnection _peerConnection;
  RTCDataChannel? _dataChannel;

  debugPrint(String? message, {int? wrapWidth}) {
      debugPrintThrottled(message, wrapWidth: wrapWidth?? 800); // Default wrap width for debug messages
    } 

  final Map<String, dynamic> _iceServers = {
    'iceServers': [
      {'urls': 'stun:stun.l.google.com:19302'},
    ]
  };

  Future<void> createPeerConnection({bool isCaller = false}) async {
    // Create connection
    _peerConnection = await createPeerConnection(_iceServers, {});

    // Set up data channel if caller
    if (isCaller) {
      _dataChannel = await _peerConnection.createDataChannel('chat', RTCDataChannelInit());
      _setupDataChannelEvents();
    }

    // Handle incoming data channel if receiver
    _peerConnection.onDataChannel = (channel) {
      _dataChannel = channel;
      _setupDataChannelEvents();
    };

    _peerConnection.onIceCandidate = (candidate) {
      // Send this to the remote peer via signaling (you handle this)
      print('New ICE candidate: ${candidate.toMap()}');
    };
  }

  void _setupDataChannelEvents() {
    _dataChannel?.onMessage = (RTCDataChannelMessage message) {
      debugPrint('Received: ${message.text}');
    };
  }

  Future<RTCSessionDescription> createOffer() async {
    final offer = await _peerConnection.createOffer();
    await _peerConnection.setLocalDescription(offer);
    return offer;
  }

  Future<RTCSessionDescription> createAnswer() async {
    final answer = await _peerConnection.createAnswer();
    await _peerConnection.setLocalDescription(answer);
    return answer;
  }

  Future<void> setRemoteDescription(RTCSessionDescription description) async {
    await _peerConnection.setRemoteDescription(description);
  }

  void sendMessage(String message) {
    if (_dataChannel != null && _dataChannel!.state == RTCDataChannelState.RTCDataChannelOpen) {
      _dataChannel!.send(RTCDataChannelMessage(message));
    } else {
      debugPrint("DataChannel not ready");
    }
  }

  void dispose() {
    _dataChannel?.close();
    _peerConnection.close();
  }
}
