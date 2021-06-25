class Patient {
  int id;
  String firstName;
  String lastName;

  double grade;
  String status;
  Patient(
    String firstName,
    String lastName,
    double grade,
  ) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  Patient.WithId(int id, String firstName, String lastName, double grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  String get getStatus {
    String message = "";
    if (this.grade < 39.0 && grade >= 38.0) {
      message = "Ateşin normal değerin üzerinde, ailene haber vermelisin";
    } else if (this.grade >= 39.0) {
      message =
          "Ateşin Yüksek bir seviyede, ailene haber verip Hastaneye gitmelisin";
    } else {
      message = "Ateşin yok";
    }
    this.status = message;
    return this.status;
  }
}
