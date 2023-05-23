import 'package:bloc/bloc.dart';
import './repository.dart';

abstract class FriendEvent {}

class FriendAdded extends FriendEvent {
  final String name;
  final String email;
  final String mobileNo;

  FriendAdded(
      {required this.name, required this.email, required this.mobileNo});
}

class FriendEdited extends FriendEvent {
  final String friendId;
  final String name;
  final String email;
  final String mobileNo;

  FriendEdited(
      {required this.friendId,
      required this.name,
      required this.email,
      required this.mobileNo});
}

class FriendState {}

class FriendInitial extends FriendState {}

class FriendLoading extends FriendState {}

class FriendAddedSuccess extends FriendState {}

class FriendAddedFailure extends FriendState {}

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  final Repository repository;

  FriendBloc({required this.repository}) : super(FriendInitial()) {
    on<FriendAdded>((event, emit) async {
      print("friend added");
      emit(FriendLoading());
      try {
        await repository.addFriend(event.name, event.email, event.mobileNo);
        emit(FriendAddedSuccess());
      } catch (_) {
        emit(FriendAddedFailure());
      }
    });

    on<FriendEdited>((event, emit) async {
      emit(FriendLoading());
      try {
        await repository.editFriend(
            event.friendId, event.name, event.email, event.mobileNo);
        emit(FriendAddedSuccess());
      } catch (_) {
        emit(FriendAddedFailure());
      }
    });
  }
}
