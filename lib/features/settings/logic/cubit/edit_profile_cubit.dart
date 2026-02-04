import 'package:bloc/bloc.dart';


class EditProfileCubit extends Cubit<bool> {
  EditProfileCubit() : super(false);

  void toggleEditMode() => emit(!state);

  void reset() => emit(false);
}
