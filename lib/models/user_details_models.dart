class UserDetailsModel {
  final String name;
  final String branch;
  final String semester;
  final String rollno;
  UserDetailsModel({
    required this.name,
    required this.branch,
    required this.semester,
    required this.rollno,
  });
  Map<String, dynamic> getJson() => {
        'name': name,
        'branch': branch,
        'semester': semester,
        'roll no': rollno,
      };
}
