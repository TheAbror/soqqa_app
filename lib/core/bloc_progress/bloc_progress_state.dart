import 'package:soqqa_app/widget_imports.dart';

abstract class BlocProgressState extends Equatable {
  final BlocProgress blocProgress;
  final String? failureMessage;

  const BlocProgressState({
    required this.blocProgress,
    this.failureMessage,
  });

  List<Object?> get blocProps;

  @override
  List<Object?> get props => [blocProgress, failureMessage, ...blocProps];
}
