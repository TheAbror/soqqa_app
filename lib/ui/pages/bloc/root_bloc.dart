// ignore_for_file: unused_local_variable

import 'package:soqqa_app/widget_imports.dart';

part 'root_state.dart';

class RootBloc extends Cubit<RootState> {
  RootBloc() : super(RootState.initial());

  void getDB() {
    AllUsers? savedUsers = boxAllUsers.get(ShPrefKeys.allUsers);

    var db = List<String>.from(state.allUsers);

    db = savedUsers!.allUsers;

    emit(state.copyWith(allUsers: db));
  }

  void addUser(String user) {
    AllUsers? savedUsers = boxAllUsers.get(ShPrefKeys.allUsers);

    if (savedUsers != null) {
      if (!savedUsers.allUsers.contains(user)) {
        savedUsers.allUsers.add(user);

        emit(state.copyWith(allUsers: savedUsers.allUsers));

        boxAllUsers.put(
          ShPrefKeys.allUsers,
          AllUsers(allUsers: savedUsers.allUsers),
        );
      }
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

  void calculate(
    String fullAmount, {
    String? discountPercent,
    String? deliverySum,
  }) {
    //! Task turn all to int  - start
    var fullAmountAsInt = int.parse(fullAmount);
    var discountAsInt = 0;
    var deliveryAsInt = 0;

    if (discountPercent != null) {
      discountAsInt = int.parse(discountPercent);
    }

    if (deliverySum != null) {
      deliveryAsInt = int.parse(deliverySum);
    }
    //! Task turn all to int  - end

    var percent = discountAsInt / 100;
    var fullMinusDeliveryFee = fullAmountAsInt - deliveryAsInt;
    var fullMinusPercent = fullAmountAsInt - fullAmountAsInt * percent;
    // finalAMOUNT = fullMinusDeliveryFee - (fullMinusDeliveryFee * percent);
  }
}
