import 'package:soqqa_app/widget_imports.dart';

part 'root_state.dart';

class RootBloc extends Cubit<RootState> {
  RootBloc() : super(RootState.initial());

  void selectTabIndex(int tabIndex) {
    emit(state.copyWith(tabIndex: tabIndex));
  }

  // AllUsers? savedUsers = boxAllUsers.get(ShPrefKeys.allUsers);

  void addUser(String user) {
    final users = List<String>.from(state.allUsers);

    users.add(user);

    emit(state.copyWith(allUsers: users));

    boxAllUsers.put(
      ShPrefKeys.allUsers,
      AllUsers(allUsers: users),
    );
  }
}
