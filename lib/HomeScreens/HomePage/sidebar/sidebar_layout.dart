import 'package:covidapp/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'sidebar.dart';


class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_SideBarLayout(),
    );
  }
}

class F_SideBarLayout extends StatefulWidget {
  @override
  _F_SideBarLayout createState() => _F_SideBarLayout();
}

class _F_SideBarLayout extends State<F_SideBarLayout> {
  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);

  }

  Widget offlineWidget (BuildContext context){
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Scaffold(
          body: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }

}
