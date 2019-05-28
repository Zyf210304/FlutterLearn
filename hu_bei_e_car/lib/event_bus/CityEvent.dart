import 'package:event_bus/event_bus.dart';

EventBus cityEventBus = EventBus();

class CityEvent {
  int code;
  String name;

  CityEvent(this.code, this.name);
}


