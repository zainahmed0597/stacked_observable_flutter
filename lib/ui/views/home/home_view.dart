import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:observable_flutter/ui/common/app_colors.dart';
import 'package:observable_flutter/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Books Api'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Center(
            child: viewModel.isBusy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: viewModel.data?.length,
                    itemBuilder: (context, index) {
                      final book = viewModel.data?[index];
                      return Card(
                        child: ListTile(
                          title: Text(book?.title ?? ''),
                        ),
                      );
                    }),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
