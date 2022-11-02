import 'package:quick_attendance/models/user_details_models.dart';
import 'package:quick_attendance/resources/cloudfirestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();
  Future<String> signUpUser(
      {required String name,
      required String branch,
      required String semester,
      required String rollno,
      required String email,
      required String password}) async {
    name.trim();
    branch.trim();
    semester.trim();
    email.trim();
    password.trim();
    String output = "Something went wrong.";
    if (name != "" &&
        branch != "" &&
        email != "" &&
        password != "" &&
        semester != "" &&
        rollno != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserDetailsModel user = UserDetailsModel(
            name: name, branch: branch, semester: semester, rollno: rollno);
        await cloudFirestoreClass.UserInfo(user: user);
        output = "Success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill up all the fields";
    }
    return output;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    email.trim();
    password.trim();
    String output = "Something went wrong.";
    if (email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        output = "Success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill up all the fields";
    }
    return output;
  }
}
