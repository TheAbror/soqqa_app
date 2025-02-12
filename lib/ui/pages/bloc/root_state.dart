part of 'root_bloc.dart';

class RootState extends Equatable {
  final List<String> allUsers;
  final List<String> selectedUsers;

  const RootState({
    required this.allUsers,
    required this.selectedUsers,
  });

  factory RootState.initial() {
    return RootState(
      allUsers: [],
      selectedUsers: [],
    );
  }

  RootState copyWith({
    List<String>? allUsers,
    List<String>? selectedUsers,
  }) {
    return RootState(
      allUsers: allUsers ?? this.allUsers,
      selectedUsers: selectedUsers ?? this.selectedUsers,
    );
  }

  @override
  List<Object?> get props => [
        allUsers,
        selectedUsers,
      ];
}
