import 'package:equatable/equatable.dart';
import 'package:product_app/auth/model/user_model.dart';

class UserCubitSate extends Equatable {
  final bool isLoading;
  final List<Users>? item;

  const UserCubitSate({
    this.isLoading = false,
    this.item,
  });

  @override
  List<Object?> get props => [isLoading, item];

  UserCubitSate copyWith({
    bool? isLoading,
    bool? isAllTextShow,
    List<Users>? item,
  }) {
    return UserCubitSate(
      isLoading: isLoading ?? this.isLoading,
      item: item ?? this.item,
    );
  }
}
