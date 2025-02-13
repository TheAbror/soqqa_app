import 'package:soqqa_app/widget_imports.dart';

class ListOfSelectedUsers extends StatelessWidget {
  final RootState state;

  const ListOfSelectedUsers({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Users: ',
          style: TextStyle(fontSize: 18, color: AppColors.primary),
        ),
        ListView.builder(
          itemCount: state.selectedUsers.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SingleUserData(
              state: state,
              index: index,
            );
          },
        ),
      ],
    );
  }
}

class SingleUserData extends StatefulWidget {
  final int index;

  final RootState state;

  const SingleUserData({
    super.key,
    required this.index,
    required this.state,
  });

  @override
  State<SingleUserData> createState() => _SingleUserDataState();
}

class _SingleUserDataState extends State<SingleUserData> {
  final usersOrderAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Text(widget.state.selectedUsers[widget.index]),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () {
              context.read<RootBloc>().removeUser(widget.index);
            },
            child: Icon(
              IconsaxPlusLinear.user_remove,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      trailing: MyField(
        controller: usersOrderAmount,
        onChanged: (value) {
          if (usersOrderAmount.text.isNotEmpty) {
            context.read<RootBloc>().chooseSingle(
                  widget.index,
                  widget.state.selectedUsers[widget.index],
                  double.parse(usersOrderAmount.text),
                );
          }
        },
      ),
      textColor: Theme.of(context).colorScheme.tertiary,
    );
  }
}
