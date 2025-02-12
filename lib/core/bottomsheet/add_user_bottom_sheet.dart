import 'package:soqqa_app/widget_imports.dart';

class AddUserBottomSheet extends StatelessWidget {
  const AddUserBottomSheet({super.key});

  static Future<String?> show(
    BuildContext parentContext,
  ) async {
    return showModalBottomSheet<String>(
      backgroundColor: Theme.of(parentContext).colorScheme.background,
      context: parentContext,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return AddUserBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBottomSheet(
      title: 'Add new user',
      heightRatio: 0.4,
      isActionEnabled: false,
      actionText: '',
      isConfirmationNeeded: false,
      action: () {},
      child: AddUserBody(),
    );
  }
}

class AddUserBody extends StatefulWidget {
  const AddUserBody({super.key});

  @override
  State<AddUserBody> createState() => AddUserBodyState();
}

class AddUserBodyState extends State<AddUserBody> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Divider(
            color: Theme.of(context).colorScheme.inversePrimary,
            height: 1.h,
            thickness: 1.h,
          ),
          SizedBox(height: 20),
          NewUserTextField(usernameController: controller),
          Spacer(),
          ActionButton(
            text: 'Add',
            onPressed: () {
              Navigator.pop(context, controller.text);
            },
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
