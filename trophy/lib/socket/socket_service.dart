import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static IO.Socket? socket;

  static void connect() {
    socket = IO.io('http://http://172.20.10.2', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket?.connect();

    socket?.onConnect((_) {
      print('Connected to WebSocket');
    });

    socket?.onDisconnect((_) {
      print('Disconnected from WebSocket');
    });

    socket?.on('homeStateUpdated', (data) {
      // Handle home state update from server
      // Example: dispatch an event to HomeBloc
    });
  }

  static void disconnect() {
    socket?.disconnect();
    socket?.close();
  }
}
