
import '../error/failure.dart';

String mapFailureToMessage(Failure failure){
  switch(failure.runtimeType){
    case ServerFailure:
          return "Server Failure"; 
    case CacheFailure:
          return "Cache faiure";
    default:
      return "Unexpected error";  
         }
}