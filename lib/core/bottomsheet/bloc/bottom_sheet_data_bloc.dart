import 'package:soqqa_app/widget_imports.dart';

part 'bottom_sheet_data_state.dart';

class BottomSheetDataBloc extends Cubit<BottomSheetDataState> {
  final String initialValue;
  final List<String> initialList;

  BottomSheetDataBloc({
    required this.initialValue,
    required this.initialList,
  }) : super(BottomSheetDataState.initial(
          initialValue: initialValue,
          initialList: initialList,
        ));

  void selectUsersToStartCalculations(String user) {
    final list = List<String>.from(state.selectedUsers);

    if (!state.selectedUsers.contains(user)) {
      list.add(user);
    }

    emit(state.copyWith(selectedUsers: list));
  }
}
