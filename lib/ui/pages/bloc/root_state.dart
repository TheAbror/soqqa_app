part of 'root_bloc.dart';

class RootState extends Equatable {
  final int tabIndex;
  final List<String> allUsers;
  final List<String> selectedUsers;
  final BlocProgress blocProgress;
  final String failureMessage;

  const RootState({
    required this.tabIndex,
    required this.allUsers,
    required this.selectedUsers,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory RootState.initial() {
    return RootState(
      tabIndex: 0,
      allUsers: [],
      selectedUsers: [],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  RootState copyWith({
    int? tabIndex,
    List<String>? allUsers,
    List<String>? selectedUsers,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return RootState(
      tabIndex: tabIndex ?? this.tabIndex,
      allUsers: allUsers ?? this.allUsers,
      selectedUsers: selectedUsers ?? this.selectedUsers,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: '',
    );
  }

  @override
  List<Object?> get props => [
        tabIndex,
        allUsers,
        selectedUsers,
        blocProgress,
        failureMessage,
      ];
}
