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

    List<NameAndSum> newlist = [];

    for (var element in state.selectedUsers) {
      newlist.add(NameAndSum(bill: 0, name: element));
    }

    emit(state.copyWith(nameAndSum: newlist));
  }

  //  void chooseSingle(int? id) {
  //   if (id != null) {
  //     final selectedValue = state.searchedList.firstWhere(
  //       (element) => element.user_id == id,
  //       orElse: () => state.searchedList.first,
  //     );

  //     emit(state.copyWith(recepientId: selectedValue.user_id));
  //   }
  // }

// List<NameAndSum> nameAndSum
  void chooseSingle(
    double howMuchWasOrder,
    String name,
  ) {
    final updatedList = List<NameAndSum>.from(state.nameAndSum);

    // var user = state.nameAndSum.firstWhere((e) => e.name == name);
    // final asdsad = user.bill = howMuchWasOrder;
    updatedList.firstWhere((e) => e.name == name).bill = howMuchWasOrder;

    emit(state.copyWith(nameAndSum: updatedList));
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
    //fullMinusDeliveryMinusPercentPercent
    var finalSum = fullMinusDeliveryFee - (fullMinusDeliveryFee * percent);
    debugPrint(finalSum.toString());

    var peopleCount = state.selectedUsers.length;
    var delvieryPerPerson = deliveryAsInt / peopleCount;
    //billPerPersonWithDelivery - if all ordered same thing or decided to split the bill
    var perPerson = (finalSum / peopleCount) + delvieryPerPerson;
    debugPrint(perPerson.toString());
  }
}
