import 'package:bloc/bloc.dart';


class EditModeCubit extends Cubit<bool> {
  EditModeCubit() : super(false);
  void toggleEditMode() => emit(!state);
  void setEditMode(bool value) => emit(value);
}
