part of 'bottom_sheet_data_bloc.dart';

class BottomSheetDataState extends Equatable {
  final List<String> initialList;
  final List<String> selectedUsers;

  const BottomSheetDataState({
    required this.initialList,
    required this.selectedUsers,
  });

  factory BottomSheetDataState.initial({
    required List<String> initialList,
    required List<String> selectedValues,
  }) {
    return BottomSheetDataState(
      initialList: initialList,
      selectedUsers: selectedValues,
    );
  }

  BottomSheetDataState copyWith({
    List<String>? initialList,
    List<String>? selectedUsers,
  }) {
    return BottomSheetDataState(
      initialList: initialList ?? this.initialList,
      selectedUsers: selectedUsers ?? this.selectedUsers,
    );
  }

  @override
  List<Object?> get props => [
        initialList,
        selectedUsers,
      ];
}
