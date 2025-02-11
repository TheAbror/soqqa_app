part of 'root_bloc.dart';

class RootState extends Equatable {
  final int tabIndex;
  final List<String> allUsers;
  final BlocProgress blocProgress;
  final String failureMessage;

  const RootState({
    required this.tabIndex,
    required this.allUsers,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory RootState.initial() {
    return RootState(
      tabIndex: 0,
      allUsers: [],
      blocProgress: BlocProgress.NOT_STARTED,
      failureMessage: '',
    );
  }

  RootState copyWith({
    int? tabIndex,
    List<String>? allUsers,
    BlocProgress? blocProgress,
    AccountType? accountType,
  }) {
    return RootState(
      tabIndex: tabIndex ?? this.tabIndex,
      allUsers: allUsers ?? this.allUsers,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: '',
    );
  }

  @override
  List<Object?> get props => [
        tabIndex,
        allUsers,
        blocProgress,
        failureMessage,
      ];
}
