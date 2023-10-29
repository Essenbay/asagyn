import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class RefresherWrapper extends StatefulWidget {
  const RefresherWrapper(
      {super.key,
      required this.onRefresh,
      required this.child,
      this.foregreound = AppColors.primary,
      this.enablePullUp = false});
  final VoidCallback onRefresh;
  final Widget child;
  final Color foregreound;
  final bool enablePullUp;

  @override
  State<RefresherWrapper> createState() => _RefresherWrapperState();
}

class _RefresherWrapperState extends State<RefresherWrapper> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: widget.enablePullUp,
      onRefresh: () {
        widget.onRefresh();
        _refreshController.refreshCompleted();
      },
      onLoading: () {
        widget.onRefresh();
        _refreshController.refreshCompleted();
      },
      header: CustomHeader(
        builder: (_, mode) => Icon(Icons.replay, color: widget.foregreound),
      ),
      footer: CustomFooter(
        builder: (_, mode) => Icon(Icons.replay, color: widget.foregreound),
      ),
      child: widget.child,
    );
  }
}
