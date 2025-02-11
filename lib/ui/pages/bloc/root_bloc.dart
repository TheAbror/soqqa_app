import 'package:soqqa_app/widget_imports.dart';

part 'root_state.dart';

class RootBloc extends Cubit<RootState> {
  RootBloc() : super(RootState.initial());

  void selectTabIndex(int tabIndex) {
    emit(state.copyWith(tabIndex: tabIndex));
  }

  void getDB() {
    AllUsers? savedUsers = boxAllUsers.get(ShPrefKeys.allUsers);

    var db = List<String>.from(state.allUsers);

    db = savedUsers!.allUsers;

    emit(state.copyWith(allUsers: db));
  }

  void addUser(String user) {
    final users = List<String>.from(state.allUsers);

    if (!state.allUsers.contains(user)) {
      users.add(user);

      emit(state.copyWith(allUsers: users));

      boxAllUsers.put(
        ShPrefKeys.allUsers,
        AllUsers(allUsers: users),
      );
    }
  }

  void addMultipleUsers(List<String> users) {
    emit(state.copyWith(selectedUsers: users));
  }

  void removeUser(int index) {
    final users = List<String>.from(state.selectedUsers);

    users.removeAt(index);

    emit(state.copyWith(selectedUsers: users));
  }
}
