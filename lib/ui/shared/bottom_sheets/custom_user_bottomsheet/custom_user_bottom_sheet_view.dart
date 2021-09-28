import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_profile_tile.dart';
import 'widgets/profile_head.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:stacked/stacked.dart';

import 'custom_user_bottom_sheet_viewmodel.dart';

class CustomUserBottomSheetView extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const CustomUserBottomSheetView({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<CustomUserBottomSheetViewModel>.reactive(
      builder: (context, model, child) => model.isBusy
          ? const Center(child: CircularProgressIndicator())
          : DraggableScrollableSheet(
              maxChildSize: 0.97,
              initialChildSize: 0.7,
              minChildSize: 0.5,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  height: height * .97,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: height * .3,
                          child: const ProfileHead(),
                        ),
                        SizedBox(
                          height: height * .1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButton(text: 'Message', onPressed: () {}),
                              CustomButton(
                                text: 'Edit Profile',
                                onPressed: () => model.navigateToEditProfile(),
                              ),
                              CustomButton.icon(
                                  icon: Icons.more_horiz_rounded,
                                  onPressed: () {}),
                            ],
                          ),
                        ),
                        const Divider(),
                        const CustomProfileTile(
                            title: 'What I do', subtitle: 'Mobile Dev'),
                        const Divider(),
                        const CustomProfileTile(
                            title: 'Display Name', subtitle: 'pauleke65'),
                        const Divider(),
                        ListTile(
                          title: const CustomText(
                              text: 'Status', fontWeight: FontWeight.w300),
                          subtitle: const Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.looks_5,
                                  color: AppColors.blueTextColor)),
                          shape: const Border(
                            top: BorderSide(
                                width: .5, color: AppColors.greyishColor),
                          ),
                          onTap: () => model.navigateToSetStatus(),
                          trailing: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.cancel)),
                        ),
                        const Divider(),
                        const CustomProfileTile(
                            title: 'Mobile Number', subtitle: '+2347023456789'),
                        const Divider(),
                        const CustomProfileTile(
                            title: 'Email Address',
                            subtitle: 'myemail@mail.com'),
                      ],
                    ),
                  ),
                );
              },
            ),
      viewModelBuilder: () => CustomUserBottomSheetViewModel(),
    );
  }
}