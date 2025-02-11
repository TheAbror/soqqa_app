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

  void search(String value) {
    final searchedList = state.initialList
        .where((element) => element.toLowerCase().contains(value.toLowerCase()))
        .toList();

    emit(state.copyWith(searchedList: searchedList));
  }

  void choose(String? value) {
    final selectedValue =
        state.searchedList.where((element) => element == value).first;

    emit(state.copyWith(selectedValue: selectedValue, isButtonEnabled: true));
  }
}
