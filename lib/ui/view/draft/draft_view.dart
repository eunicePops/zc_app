import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:stacked/stacked.dart';
<<<<<<< HEAD

import 'app/data.dart';
import 'app/drafted_item_widget.dart';
=======
>>>>>>> upstream/dev
import 'draft_viewmodel.dart';

class DraftView extends StatelessWidget {
  const DraftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DraftViewModel>.reactive(
<<<<<<< HEAD
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,
                  color: AppColors.deepBlackColor),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: false,
            title: Text(
              'Draft',
              style: AppTextStyles.heading7,
            ),
          ),
          body: ListView.builder(
            //physics: BouncingScrollPhysics(),
              itemCount: draftedList.length,
              itemBuilder: (context, index) {
                return DraftedItemWidget(
                  username: draftedList[index].username,
                  time: draftedList[index].time,
                  message: draftedList[index].message,
                );
              }),
          backgroundColor: AppColors.whiteColor,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.open_in_new_outlined,
              color: AppColors.whiteColor,
            ),
            backgroundColor: AppColors.zuriPrimaryColor,
          ),
        ),
        viewModelBuilder: () => DraftViewModel());
=======

      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
          leading: const Icon(Icons.arrow_back_ios),
        ),
        body: ListView.builder(
          itemCount: model.draft.length,
          itemBuilder: (BuildContext context, int index) {
            return model.draft[index];
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add draft',
          child: const Icon(Icons.notes),
        ),
      ),
      viewModelBuilder: () => DraftViewModel(),
    );
>>>>>>> upstream/dev
  }
}
