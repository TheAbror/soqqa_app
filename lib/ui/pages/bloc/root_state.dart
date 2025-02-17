part of 'root_bloc.dart';

class RootState extends Equatable {
  final bool isResultReady;
  final List<String> allUsers;
  final List<String> selectedUsers;
  final List<NameAndSum> nameAndSum;
  final List<NameAndSum> finalResult;

  const RootState({
    required this.isResultReady,
    required this.allUsers,
    required this.selectedUsers,
    required this.nameAndSum,
    required this.finalResult,
  });

  factory RootState.initial() {
    return RootState(
      isResultReady: false,
      allUsers: [],
      selectedUsers: [],
      nameAndSum: [],
      finalResult: [],
    );
  }

  RootState copyWith({
    bool? isResultReady,
    List<String>? allUsers,
    List<String>? selectedUsers,
    List<NameAndSum>? nameAndSum,
    List<NameAndSum>? finalResult,
  }) {
    return RootState(
      isResultReady: isResultReady ?? this.isResultReady,
      allUsers: allUsers ?? this.allUsers,
      selectedUsers: selectedUsers ?? this.selectedUsers,
      nameAndSum: nameAndSum ?? this.nameAndSum,
      finalResult: finalResult ?? this.finalResult,
    );
  }

  @override
  List<Object?> get props => [
        allUsers,
        selectedUsers,
        nameAndSum,
        finalResult,
      ];
}

class NameAndSum {
  String name;
  double bill;

  NameAndSum({
    required this.name,
    required this.bill,
  });
}
