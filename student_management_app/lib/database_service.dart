import 'package:cloud_firestore/cloud_firestore.dart';

import 'models.dart';


class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // مرجع المجموعة
  final CollectionReference studentCollection = FirebaseFirestore.instance.collection('students');

  Future<void> updateStudentData(String name, String address, String phoneNumber) async {
    return await studentCollection.doc(uid).set({
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      // الحقول الأخرى حسب الحاجة
    });
  }

  // بيانات الطالب من اللقطة
  Student _studentFromSnapshot(DocumentSnapshot snapshot) {
    return Student(
      id: uid,
      name: snapshot['name'],
      address: snapshot['address'],
      phoneNumber: snapshot['phoneNumber'],
      grades: snapshot['grades'],
      attendance: snapshot['attendance'],
      payments: snapshot['payments'],
      homework: snapshot['homework'],
    );
  }

  // الحصول على تدفق بيانات الطالب
  Stream<Student> get studentData {
    return studentCollection.doc(uid).snapshots().map(_studentFromSnapshot);
  }
}
