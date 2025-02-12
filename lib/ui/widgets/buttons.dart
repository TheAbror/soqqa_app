import 'package:soqqa_app/widget_imports.dart';

class Buttons extends StatelessWidget {
  final RootState state;

  const Buttons({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActionButton(
          isFilled: false,
          text: 'Add more users',
          onPressed: () async {
            final result = await PrimaryBottomSheet.show(
              context,
              title: 'All users',
              heightRatio: 0.8,
              selectedValues: state.selectedUsers,
              initialList: state.allUsers,
            );

            if (result != null && result.isNotEmpty) {
              if (!context.mounted) return;
              context.read<RootBloc>().addMultipleUsers(result);
            }
          },
        ),
        SizedBox(height: 20.h),
        ActionButton(
          text: 'Calculate',
          onPressed: () {},
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
