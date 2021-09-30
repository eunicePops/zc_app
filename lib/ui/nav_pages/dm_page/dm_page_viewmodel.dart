import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/package/base/server-request/dms/dms_api_service.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/user_service.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmPageViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final userService = locator<UserService>();
  final connectivityService = locator<ConnectivityService>();
  final dmApiService = locator<DMApiService>();
  final snackbar = locator<SnackbarService>();
  final channelsApiService = locator<ChannelsApiService>();
  final api = ZuriApi()
 //https://dm.zuri.chat/dmapi/v1/org/{org_id}/users/{user_id}/rooms
  void init (){
    https://dm.zuri.chat/dmapi/v1/org/{org_id}/users/{user_id}/rooms
  }
  void navigateToDmUserView() {
    navigationService.navigateTo(Routes.dmUserView);
  }

  void navigateToJumpToScreen() {
    navigationService.navigateTo(Routes.dmJumpToView);
  }
  getDmAndChannelsList() async {
    homePageList = [];
    setBusy(true);

    List? channelsList = await channelsApiService.getActiveDms();

    channelsList.forEach(
          (data) {
        homePageList.add(
          HomeItemModel(
            type: HomeItemType.channels,
            unreadCount: 0,
            name: data['name'],
            id: data['_id'],
            public: data['private'] != "True",
            membersCount: data['members'],
          ),
        );
      },
    );


    //Todo: add channels implementation

    unreads.clear();
    directMessages.clear();
    joinedChannels.clear();

    setAllList();
    notifyListeners();
    print('All channels $homePageList');
    // //get dms data
    // List? dmList = await dmApiService.getActiveDms();
    // dmList.forEach((data) {
    //   dmApiService.getUser(data);
    //   // HomeItemModel(
    //   //   type: HomeItemType.dm,
    //   //   unreadCount: 0,
    //   //   name: 'alfred',
    //   // );
    // });
    setBusy(false);
  }


}
