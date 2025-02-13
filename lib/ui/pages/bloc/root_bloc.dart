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

  void addNewUser(String user) {
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

    List<NameAndSum> newlist = [];

    for (var element in state.selectedUsers) {
      newlist.add(NameAndSum(bill: 0, name: element));
    }

    emit(state.copyWith(nameAndSum: newlist));
  }

  void chooseSingle(
    int index,
    String name,
    double howMuchWasOrder,
  ) {
    final list = List<NameAndSum>.from(state.nameAndSum).toList();

    list[index] = NameAndSum(name: name, bill: howMuchWasOrder);

    emit(state.copyWith(nameAndSum: list));
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

    if (discountPercent != null && discountPercent.isNotEmpty) {
      discountAsInt = int.parse(discountPercent);
    }

    if (deliverySum != null && deliverySum.isNotEmpty) {
      deliveryAsInt = int.parse(deliverySum);
    }
    //! Task turn all to int  - end

    //! Discount & fullPrice - delivery  - start
    var percent = discountAsInt / 100;
    var fullMinusDeliveryFee = fullAmountAsInt - deliveryAsInt;

    //fullMinusDeliveryMinusPercentPercent
    var finalSum = fullMinusDeliveryFee - (fullMinusDeliveryFee * percent);
    debugPrint(finalSum.toString());

    //! Discount & fullPrice - delivery  - end

    calculatedEach(percent);
  }

  void calculatedEach(double discount) {
    final list = List<NameAndSum>.from(state.nameAndSum).toList();
    List<NameAndSum> newlist = [];

    for (var element in list) {
      newlist.add(
        NameAndSum(
          name: element.name,
          bill: element.bill - (element.bill * discount),
        ),
      );
    }

    emit(state.copyWith(finalResult: newlist, isResultReady: true));
  }

  void makeIsReadyFalse() {
    emit(state.copyWith(isResultReady: false));
  }
}
