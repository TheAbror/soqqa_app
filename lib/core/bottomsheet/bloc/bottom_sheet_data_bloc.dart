import 'package:soqqa_app/widget_imports.dart';

part 'bottom_sheet_data_state.dart';

class BottomSheetDataBloc extends Cubit<BottomSheetDataState> {
  final List<String> initialList;
  final List<String> selectedValues;

  BottomSheetDataBloc({
    required this.selectedValues,
    required this.initialList,
  }) : super(BottomSheetDataState.initial(
          initialList: initialList,
          selectedValues: selectedValues,
        ));

  void selectUsersToStartCalculations(String user) {
    final list = List<String>.from(state.selectedUsers);

    if (!state.selectedUsers.contains(user)) {
      list.add(user);
    } else {
      list.remove(user);
    }

    emit(state.copyWith(selectedUsers: list));
  }

  void addUser(String user) {
    final list = List<String>.from(state.initialList);

    if (!state.initialList.contains(user)) {
      list.add(user);
    }

    emit(state.copyWith(initialList: list));
  }
}
