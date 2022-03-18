import 'package:moim_app/core/router/app_state.dart';
import 'package:moim_app/core/storage/local_storage.dart';
import 'package:moim_app/core/storage/shared_preference_local_storage.dart';
import 'package:moim_app/service/mock_api.dart';

class MockUserService {
  LocalStorage localStorage = SharedPreferenceLocalStorage();
  MockApi mockApi = MockApi();

  MockUserService() {
    localStorage.init();
  }

  Future<int?> join() async {
    var response =
        await mockApi.join(UserJoinRequest('test@test.com', '12345'));
    return response.id;
  }

  Future<String?> auth() async {
    var response =
        await mockApi.auth(UserAuthenticationRequest('test@test.com', '12345'));
    if (response.refreshToken != null) {
      localStorage.save('refreshToken', response.refreshToken);
      return response.refreshToken;
    } else {
      return null;
    }
  }

  Future<Map?> locationSearch(String inputAddress) async {
    var response =
        await mockApi.locationSearch(LocationSearchRequest(inputAddress));
    if (response.latlng != null) {
      return response.latlng;
    } else {
      return null;
    }
  }
}
