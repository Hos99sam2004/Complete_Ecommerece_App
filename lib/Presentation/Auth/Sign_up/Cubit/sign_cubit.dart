import 'package:bloc/bloc.dart';
import 'package:complete_e_commerce_app/Presentation/Auth/Sign_up/Model/Signup_model.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/ApiConst.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/Dio_Helper.dart';
import 'package:meta/meta.dart';

part 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit() : super(SignInitial());
  SignupModel signmodel = SignupModel();

  void SignUp({
    required String email,
    required String password,
    required String PhoneNumber,
    required String UserName,

  }) async {

          emit(SignLoading());
        try{
          final response = await ApiHelper.instance.post(url: ApiConst.SIGNUP, body: {
            "email": email,
            "password":password,
            "phone": PhoneNumber,
            "name": UserName
          });
          signmodel=SignupModel.fromJson(response.data);
          if(signmodel.status==true||response.statusCode==200){
            // HiveHelper.Save_Token(loginModel.data!.token!);
            emit(SignSuccess(signmodel.message!));
          }else{
            emit(SignError(signmodel.message!));
          }
  }  catch (e) {
  // TODO
          emit(SignError("Error : $e "));
  }}

}






