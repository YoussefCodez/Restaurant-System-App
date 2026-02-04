import 'package:bloc/bloc.dart';

class LocationCubit extends Cubit<String> {
  LocationCubit() : super('Cairo');

  void setLocation(String location) => emit(location);
}
