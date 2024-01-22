import 'package:modernlogintute/model/student.dart';
import 'package:modernlogintute/model/studentActivity.dart';

class UserProfile {
  Student? student;
  List<StudentActivity>? activities;

  UserProfile({required Student this.student, required List<StudentActivity> this.activities});
}
