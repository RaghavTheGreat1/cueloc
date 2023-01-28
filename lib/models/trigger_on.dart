enum TriggerOn {
  entry,
  exit,
}

extension TriggerOnExt on TriggerOn {
 static  TriggerOn fromName(String name) {
    late TriggerOn triggerOn;
    switch (name) {
      case 'entry':
        triggerOn = TriggerOn.entry;
        break;
      case 'exit':
        triggerOn = TriggerOn.exit;
        break;
      default:
        throw (Exception("No such TriggerOn enum found!"));
    }
    return triggerOn;
  }
}
