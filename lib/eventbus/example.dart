
/*
EventBus _eventBus;
StreamSubscription _subscription;

_eventBus = injector.get<EventBus>();

//subscribe to a specific event
_subscription = _eventBus.on<AnimalEvent>().listen((event) {
           onEventFired(event);
       });

  void onEventFired(AnimalEvent event) {
    Logger.debug(tag: _tag, message: "onEventFired ${event.toString()}");
    Navigator.pushNamed(context, 'view_animal/${event.data}');
  }


//send an event
_eventBus.fire(new AnimalEvent(data: obj, action: Choices.EDIT));

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
  */