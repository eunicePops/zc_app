/*
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'dm_viewmodel.dart';

class DmView extends StatelessWidget {
  const DmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ViewModelBuilder<DmViewModel>.reactive(
        viewModelBuilder: () => DmViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(model.title),
              backgroundColor: AppColors.zuriPrimaryColor,
            ),
          );
        });
  }
}
*/
