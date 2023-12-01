import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/apistate.dart';
import 'package:weatherapp/repo.dart';

class APIBloc extends Bloc<APIEvent, APIState> {
  APIBloc() : super(APIInitial()) {
    final RepositaryAPI apiRepository = RepositaryAPI();

    on<GetAPI>((event, emit) async {
      try {
        emit(APILoading());
        dynamic myList = await apiRepository.ListApi();
        emit(APILoaded(myList));
        // if (myList.error != null) {
        //   emit(APIError(myList.error));
        // }
      } on InternetError {
        emit(const APIError("NETWORK ERROR"));
      }
    });
  }
}
