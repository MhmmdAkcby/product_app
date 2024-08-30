import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/auth/cubit/user_cubit_sate.dart';
import 'package:product_app/auth/model/user_model.dart';
import 'package:product_app/auth/service/user_service.dart';

class UserCubit extends Cubit<UserCubitSate> {
  final IUserService _userService;

  UserCubit(IUserService userService)
      : _userService = userService,
        super(const UserCubitSate());

  Future<void> fetchUserItem() async {
    if (state.item != null && state.item!.isNotEmpty) return;

    emit(state.copyWith(isLoading: true));
    final response = await _userService.fetchUserItem();
    emit(state.copyWith(isLoading: false, item: response?.users ?? []));
  }

  void loadUser(UserModel user) {
    emit(state.copyWith(item: user.users));
  }
}
