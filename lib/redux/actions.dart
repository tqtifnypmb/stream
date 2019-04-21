
enum ActionType {
  fetchTimeline,
  refreshTimeline
}

class Action {
  final ActionType type;
  dynamic payload;

  Action(this.type) {
    this.payload = null;
  }
}