import 'package:hive/hive.dart';

part 'current_user.g.dart';

@HiveType(typeId: 2)
class AllUsers {
  @HiveField(0)
  List<String> allUsers;

  AllUsers({List<String>? allUsers}) : allUsers = allUsers ?? [];
}
