class Student {
  final String id;
  final String name;
  final String address;
  final String phoneNumber;
  final List<Grade> grades;
  final List<Attendance> attendance;
  final List<Payment> payments;
  final List<Homework> homework;

  Student({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.grades,
    required this.attendance,
    required this.payments,
    required this.homework,
  });
}

class Grade {
  final String subject;
  final double score;
}

class Attendance {
  final DateTime date;
  final bool isPresent;
}

class Payment {
  final double amount;
  final DateTime date;
}

class Homework {
  final String description;
  final bool isCompleted;
}
