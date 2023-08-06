
enum FormType {
  create,
  read,
  edit,
}

extension FormTypeExt on FormType {
  static FormType fromString(String value) {
    switch (value.toLowerCase()) {
      case 'create':
        return FormType.create;
      case 'read':
        return FormType.read;
      case 'edit':
        return FormType.edit;
      default:
        return FormType.create;
    }
  }
}
