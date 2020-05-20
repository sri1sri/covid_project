import 'package:bloc/bloc.dart';
import 'package:covidapp/HomeScreens/HomePage/pages/personalData.dart';
import 'package:covidapp/HomeScreens/HomePage/pages/settings.dart';
import '../pages/myaccountspage.dart';

import '../pages/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  PersonalDataClickedevent,
  SettingsClickedevent,

}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountsPage();
        break;
      case NavigationEvents.PersonalDataClickedevent:
        yield PersonalDataPage();
        break;
      case NavigationEvents.SettingsClickedevent:
        yield SettingsPage();
        break;
    }
  }
}
