import 'package:soqqa_app/widget_imports.dart';

part 'root_state.dart';

class RootBloc extends Cubit<RootState> {
  RootBloc() : super(RootState.initial());

  void calculate(
    String fullAmount, {
    String? discountPercent,
    String? deliverySum,
  }) {
    var fullAmountAsInt = double.parse(fullAmount);
    var discountAsInt = 0.0;
    var deliveryAsInt = 0.0;

    if (discountPercent != null && discountPercent.isNotEmpty) {
      discountAsInt = double.parse(discountPercent);
    }

    if (deliverySum != null && deliverySum.isNotEmpty) {
      deliveryAsInt = double.parse(deliverySum);
    }

    double sumOfAllUserInputs = 0;
    for (var element in state.nameAndSum) {
      sumOfAllUserInputs = element.bill + sumOfAllUserInputs;
    }

    if (deliveryAsInt == 0 && discountAsInt == 0) {
      calculateRestaurantCase(
        fullAmountAsInt,
        sumOfAllUserInputs,
      );
    } else {
      // case to know whether discount is in % or soums
      var discount = 0.0;
      if (discountAsInt != 0) {
        if (discountAsInt > 99) {
          discount = discountAsInt;
        } else {
          discount = discountAsInt / 100;
        }
      }

      //main logic division

      if (discount != 0 && discountAsInt > 99) {
        calculatedDiscountInSOUMS(
          fullAmountAsInt,
          deliveryAsInt,
          discountAsInt,
        );
      } else if (discount != 0) {
        calculatedEachWithPercentDiscount(discount, deliveryAsInt);
      }
      //write case when no discount but delivery fee
      else if (discount == 0 && deliveryAsInt != 0) {
        noDiscountButDelivery(
          fullAmountAsInt,
          deliveryAsInt,
          sumOfAllUserInputs,
        );
      } else {
        calculatedWithoutDiscount(deliveryAsInt);
      }
    }
  }

  void noDiscountButDelivery(
    double fullAmountAsInt,
    double deliveryAsInt,
    double sumOfAllUserInputs,
  ) {
    final list = List<NameAndSum>.from(state.nameAndSum).toList();
    List<NameAndSum> newlist = [];
    final fullMinusDelivery = fullAmountAsInt - deliveryAsInt;

    final leftoverPerPerson =
        (fullMinusDelivery - sumOfAllUserInputs) / state.selectedUsers.length;

    final deliveryPerPerson = deliveryAsInt / state.selectedUsers.length;

    for (var element in list) {
      newlist.add(
        NameAndSum(
          name: element.name,
          bill: element.bill + deliveryPerPerson + leftoverPerPerson,
        ),
      );
    }

    emit(state.copyWith(
      finalResult: newlist,
      isResultReady: true,
    ));
  }

  // write case when no discount & no delivery
  calculateRestaurantCase(double fullAmout, double sumOfAllUserInputs) {
    final list = List<NameAndSum>.from(state.nameAndSum).toList();

    List<NameAndSum> newlist = [];

    double additionalSoumForService = fullAmout - sumOfAllUserInputs;
    double additionalServicePerPerson =
        additionalSoumForService / state.selectedUsers.length;

    for (var element in list) {
      newlist.add(
        NameAndSum(
          name: element.name,
          bill: element.bill + additionalServicePerPerson,
        ),
      );
    }

    emit(state.copyWith(
      finalResult: newlist,
      isResultReady: true,
    ));
  }

  //example:  Wendies gave 35.000 soums discount
  void calculatedDiscountInSOUMS(
    double fullSum,
    double delivery,
    double discountInSoums,
  ) {
    final list = List<NameAndSum>.from(state.nameAndSum).toList();
    List<NameAndSum> newlist = [];

    final discountInSoumsForEachPerson = discountInSoums / list.length;
    //work on delivery
    final deliveryPerPerson = delivery / list.length;

    for (var element in list) {
      newlist.add(
        NameAndSum(
          name: element.name,
          bill: element.bill - discountInSoumsForEachPerson + deliveryPerPerson,
        ),
      );
    }

    emit(state.copyWith(
      finalResult: newlist,
      isResultReady: true,
    ));
  }

  //example: At the beginning Uzum used to give 30% off for the first order

  void calculatedEachWithPercentDiscount(double discount, double delivery) {
    final list = List<NameAndSum>.from(state.nameAndSum).toList();
    List<NameAndSum> newlist = [];

    final deliveryPerPerson = delivery / list.length;

    for (var element in list) {
      newlist.add(
        NameAndSum(
          name: element.name,
          bill: element.bill - (element.bill * discount) + deliveryPerPerson,
        ),
      );
    }

    emit(state.copyWith(
      finalResult: newlist,
      isResultReady: true,
    ));
  }

  //self explanatory

  void calculatedWithoutDiscount(double deliveryAsInt) {
    final list = List<NameAndSum>.from(state.nameAndSum).toList();
    List<NameAndSum> newlist = [];
    final deliveryPerPerson = deliveryAsInt / state.nameAndSum.length;

    for (var element in list) {
      newlist.add(
        NameAndSum(
          name: element.name,
          bill: element.bill + deliveryPerPerson,
        ),
      );
    }

    emit(state.copyWith(
      finalResult: newlist,
      isResultReady: true,
    ));
  }

//! ---------------------------------------------------------------------------------------------------

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

  void removeUserFromDb(int index) {
    final users = List<String>.from(state.allUsers);

    users.removeAt(index);

    emit(state.copyWith(allUsers: users));
  }

  void makeIsReadyFalse() {
    emit(state.copyWith(isResultReady: false));
  }

  void makeIsFullSoumMatchWithEachPersonTotal() {
    emit(state.copyWith(isResultReady: false));
  }
}
