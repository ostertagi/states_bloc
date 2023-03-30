abstract class BaseEvent {}

// class BusEvent {
//   final bool data;

//   BusEvent(this.data);
// }

class MessageEvent {
  final String? message;

  const MessageEvent(this.message);
}
 
