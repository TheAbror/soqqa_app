part of 'root_bloc.dart';

class RootState extends Equatable {
  final List<String> allUsers;
  final List<String> selectedUsers;
  final List<NameAndSum> nameAndSum;

  const RootState({
    required this.allUsers,
    required this.selectedUsers,
    required this.nameAndSum,
  });

  factory RootState.initial() {
    return RootState(
      allUsers: [],
      selectedUsers: [],
      nameAndSum: [],
    );
  }

  RootState copyWith({
    List<String>? allUsers,
    List<String>? selectedUsers,
    List<NameAndSum>? nameAndSum,
  }) {
    return RootState(
      allUsers: allUsers ?? this.allUsers,
      selectedUsers: selectedUsers ?? this.selectedUsers,
      nameAndSum: nameAndSum ?? this.nameAndSum,
    );
  }

  @override
  List<Object?> get props => [
        allUsers,
        selectedUsers,
        nameAndSum,
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
