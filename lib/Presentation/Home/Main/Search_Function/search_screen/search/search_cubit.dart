import 'package:bloc/bloc.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/ApiConst.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/Cache_Helper.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/Dio_Helper.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Models/Search_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  // SearchModel searchProducts =new SearchModel();
  SearchModel searchProducts = SearchModel();
  void search({
    required String searchKey,
  }) async {
    emit(HomeSearchLoading());
    try {
      final response = await ApiHelper.instance.post(
        url: ApiConst.SEARCH,
        headers: {"Authorization": " ${CacheHelper.getData(key: "token")}"},
      );
      searchProducts = SearchModel.fromJson(response.data);
      if (searchProducts.status == true) {
        print(response.data);
        emit(HomeSearchSuccess());
      } else {
        // print(searchProducts);
        emit(HomeSearchError());
      }
    } catch (e) {
      print("$e");
      emit(HomeSearchError());
    }
  }

  void Cprint() {
    print("searchProducts.data!.data![0].name");
  }
}
