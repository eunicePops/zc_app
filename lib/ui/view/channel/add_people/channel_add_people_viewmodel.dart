import 'package:hng/app/app.locator.dart';
import 'package:hng/models/user_search_model.dart';
<<<<<<< HEAD
import 'package:hng/package/base/server-request/api/http_api.dart';
=======
import 'package:hng/package/base/server-request/api/zuri_api.dart';
>>>>>>> upstream/dev
import 'package:hng/package/base/server-request/organization_request/organization_api_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
<<<<<<< HEAD
<<<<<<< HEAD

import 'package:hng/models/static_user_model.dart';
=======
>>>>>>> upstream/dev
=======
>>>>>>> addpeople
import 'package:stacked_services/stacked_services.dart';

class ChannelAddPeopleViewModel extends BaseViewModel {
  final organizationApi = OrganizationApiService();
  final storageService = locator<SharedPreferenceLocalStorage>();
<<<<<<< HEAD
<<<<<<< HEAD
  final navigationService = locator<NavigationService>();
 // final api = HttpApiService("https://channels.zuri.chat/api/v1");
  final api = HttpApiService(channelsBaseUrl);
=======
  final _navigationService = locator<NavigationService>();
  final api = ZuriApi(channelsBaseUrl);

  String? get token => storageService.getString(StorageKeys.currentSessionToken);

>>>>>>> upstream/dev
=======
  final _navigationService = locator<NavigationService>();
 // final api = HttpApiService("https://channels.zuri.chat/api/v1");
  final api = HttpApiService(channelsBaseUrl);

>>>>>>> addpeople
  bool get allMarked =>
      markedUsers.length == matchingUsers.length && matchingUsers.isNotEmpty;

  late List<UserSearch> matchingUsers = [];
  late List<UserSearch> markedUsers = [];

  List<UserSearch> users = [


  ];

  navigateBack() => _navigationService.popRepeated(1);
  void onSearchUser(String input) {

    matchingUsers = [
      ...users.where(
          (user) => user.userName!.toLowerCase().contains(input.toLowerCase()))
    ];
    notifyListeners();
  }

  void onFetchMembers() async {
    setBusy(true);
    matchingUsers = users = await organizationApi.fetchMembersInOrganization(orgId!);
    setBusy(false);
  }
//TODO: Change channelID
  void onAddButtonTap() async {
    setBusy(true);
    for (var user in markedUsers) {
      await addMemberToChannel("6148c952e4b2aebf8ec8ccd0", user.id!);
      print(user.id);
    }
    setBusy(false);
<<<<<<< HEAD
<<<<<<< HEAD
    navigationService.popRepeated(1);
=======
    _navigationService.popRepeated(1);
>>>>>>> upstream/dev
=======
    _navigationService.popRepeated(1);
>>>>>>> addpeople
  }

 Future <void> addMemberToChannel(String channelId, String userId) async {
    await api.post(
      "/$orgId/channels/$channelId/members/",
    //  "/614679ee1a5607b13c00bcb7/channels/$channelId/members/",
<<<<<<< HEAD
      headers: {'Authorization': 'Bearer ${organizationApi.token}',"Content-Type": "application/json",},
      data: {"_id":userId, "role_id": "",
=======
      token: token,
      body: {"_id":userId, "role_id": "",
>>>>>>> upstream/dev
        "is_admin": false,
        "notifications": {
          "additionalProp1": "",
          "additionalProp2": "",
          "additionalProp3": ""
        }},
    );
  }

  void onMarkOne(bool? marked, int i) {
    if (marked!)
      markedUsers.add(matchingUsers[i]);
    else
      markedUsers.remove(matchingUsers[i]);
    notifyListeners();
  }

  void onMarkAll(bool? marked) {
    markedUsers = marked! ? matchingUsers : [];
    notifyListeners();
  }

  String? get orgId => storageService.getString(StorageKeys.currentOrgId);
}

