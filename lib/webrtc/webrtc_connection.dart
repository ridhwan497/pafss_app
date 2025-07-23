import 'dart:typed_data';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:software_project_1/webrtc/signalling_service.dart';
import 'webrtc_events.dart';

class WebRTCConnection {
  final SignalingService signaling;
  late RTCPeerConnection _peerConnection;
  RTCDataChannel? _dataChannel;
  void Function(WebRTCEvent)? onEvent;

  WebRTCConnection({required this.signaling});

  Future<void> init(int userId, int targetId) async {
    signaling.connect(userId);

    _peerConnection = await createPeerConnection({
      'iceServers': [
        {'urls': 'stun:stun.l.google.com:19302'},
      ],
    });

    signaling.onOffer(_handleOffer);
    signaling.onAnswer(_handleAnswer);
    signaling.onIceCandidate(_handleRemoteCandidate);

    _dataChannel = await _peerConnection.createDataChannel(
      'fileTransfer',
      RTCDataChannelInit(),
    );

    _dataChannel?.onDataChannelState = (state) {
      if (state == RTCDataChannelState.RTCDataChannelOpen) {
        onEvent?.call(WebRTCEvent(WebRTCEventType.dataChannelOpen));
      }
    };

    _peerConnection.onIceCandidate = (candidate) {
      signaling.sendIceCandidate(targetId, {
        'candidate': candidate.candidate,
        'sdpMid': candidate.sdpMid,
        'sdpMLineIndex': candidate.sdpMLineIndex,
      });
    };

    _setupReceiver();

    var offer = await _peerConnection.createOffer();
    await _peerConnection.setLocalDescription(offer);
    signaling.sendOffer(targetId, {
      'sdp': offer.sdp,
      'type': offer.type,
    });
  }

  Future<void> _handleOffer(Map<String, dynamic> data) async {
    await _peerConnection.setRemoteDescription(
      RTCSessionDescription(data['offer']['sdp'], data['offer']['type']),
    );
    var answer = await _peerConnection.createAnswer();
    await _peerConnection.setLocalDescription(answer);
    signaling.sendAnswer(data['from'], {
      'sdp': answer.sdp,
      'type': answer.type,
    });
  }

  Future<void> _handleAnswer(Map<String, dynamic> data) async {
    await _peerConnection.setRemoteDescription(
      RTCSessionDescription(data['answer']['sdp'], data['answer']['type']),
    );
  }

  void _handleRemoteCandidate(Map<String, dynamic> data) {
    var candidate = RTCIceCandidate(
      data['candidate'],
      data['sdpMid'],
      data['sdpMLineIndex'],
    );
    _peerConnection.addCandidate(candidate);
  }

  void sendFile(Uint8List bytes) {
    const chunkSize = 16000;
    for (var i = 0; i < bytes.length; i += chunkSize) {
      final chunk = bytes.sublist(
        i,
        (i + chunkSize > bytes.length) ? bytes.length : i + chunkSize,
      );
      _dataChannel?.send(RTCDataChannelMessage.fromBinary(chunk));
    }
    onEvent?.call(WebRTCEvent(WebRTCEventType.fileTransferComplete));
  }

  List<Uint8List> _receivedChunks = [];

  void _setupReceiver() {
    _peerConnection.onDataChannel = (channel) {
      channel.onMessage = (message) {
        if (message.isBinary) {
          _receivedChunks.add(message.binary);
          onEvent?.call(WebRTCEvent(WebRTCEventType.fileChunkReceived, message.binary));
        }
      };
    };
  }
}
