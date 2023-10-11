class ContactModel {
  late int? id;
  late String? contactName;
  late String? contactNumber;

  ContactModel({
    this.id,
    this.contactName,
    this.contactNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'contactName': contactName,
      'contactNumber': contactNumber,
    };
  }

  ContactModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    contactName = map['contactName'];
    contactNumber = map['contactNumber'];
  }
}
