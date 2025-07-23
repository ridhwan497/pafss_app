enum WebRTCEventType {
  connected,
  disconnected,
  dataChannelOpen,
  dataChannelClosed,
  fileChunkReceived,
  fileTransferComplete,
}

class WebRTCEvent {
  final WebRTCEventType type;
  final dynamic payload;

  WebRTCEvent(this.type, [this.payload]);
}
