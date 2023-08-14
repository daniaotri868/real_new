part of 'app_cubit.dart';

@immutable
abstract class AppState {

}

class AppInitial extends AppState {}
class AppChangeIconFavorite extends AppState {}
class AppChangCurrentIndex extends AppState {}
class AppChangIconVisib extends AppState {}


class AppLoadingGetHouses extends AppState {}
class AppSuccessfulGetHouses extends AppState {
  List<Houses> result;
  AppSuccessfulGetHouses(this.result);
}
class AppErrorGetHouses extends AppState {}





class AppLoadingGetCars extends AppState {}
class AppSuccessfulGetCars extends AppState {
  List<Cars> result;
  AppSuccessfulGetCars(this.result);
}
class AppErrorGetCars extends AppState {}



class AppLoadingGetMyPost extends AppState {}
class AppSuccessfulGetMyPost  extends AppState {
  List<myPost> result;
  AppSuccessfulGetMyPost (this.result);
}
class AppErrorGetMyPost  extends AppState {}



class AppLoadingGetLands extends AppState {}
class AppSuccessfulGetLands  extends AppState {
  List<Lands> result;
  AppSuccessfulGetLands (this.result);
}
class AppErrorGetLands  extends AppState {}



class AppLoadingGetNotification extends AppState {}
class AppSuccessfulGetNotification  extends AppState {
  List result;
  AppSuccessfulGetNotification (this.result);
}
class AppErrorGetNotification  extends AppState {}



class AppLoadingGetUser extends AppState {}
class AppSuccessfulGetUser extends AppState {

}
class AppErrorGetUser extends AppState {}

class AppErrorPostLogin extends AppState {}
class AppSuccessfulPostLogin extends AppState {}
class AppLoadingPostLogin extends AppState {}

class AppErrorPostHouses extends AppState {}
class AppSuccessfulPostHouses extends AppState {}
class AppLoadingPostHouses extends AppState {}


class AppErrorPostHousesFilter extends AppState {}
class AppSuccessfulPostHousesFilter extends AppState {}
class AppLoadingPostHousesFilter extends AppState {}



class AppErrorPostLandsFilter extends AppState {}
class AppSuccessfulPostLandsFilter extends AppState {}
class AppLoadingPostLandsFilter extends AppState {}




class AppErrorPostCarsFilter extends AppState {}
class AppSuccessfulPostCarsFilter extends AppState {}
class AppLoadingPostCarsFilter extends AppState {}



class AppErrorPostCreateUser extends AppState {}
class AppSuccessfulPostCreateUser extends AppState {}
class AppLoadingPostCreateUser extends AppState {}


class AppErrorPostEditeUser extends AppState {}
class AppSuccessfulPostEditeUser extends AppState {}
class AppLoadingPostEditeUser extends AppState {}


class AppImageCreateUser extends AppState {}
class AppListImageAddPostHouses extends AppState {}
class AppListImageLoadingPostHouses extends AppState {}
class AppListImageAddPostCars extends AppState {}
class AppListImageLoadingPostCars extends AppState {}
class AppListImageAddPostLands extends AppState {}
class AppListImageLoadingPostLands extends AppState {}


class AppGetDataBase extends AppState {}
class AppCreateDataBase extends AppState {}
class AppLoadingGetDataBase extends AppState {}
class AppInsertDataBase extends AppState {}
class AppDeleteDataBase extends AppState {}




class AppGetDataBase2 extends AppState {}
class AppCreateDataBase2 extends AppState {}
class AppLoadingGetDataBase2 extends AppState {}
class AppInsertDataBase2 extends AppState {}
class AppDeleteDataBase2 extends AppState {}





class AppGetDataBase3 extends AppState {}
class AppCreateDataBase3 extends AppState {}
class AppLoadingGetDataBase3 extends AppState {}
class AppInsertDataBase3 extends AppState {}
class AppDeleteDataBase3 extends AppState {}





class AppSearch extends AppState {}
class AppChangSelectRadioButtonHouses extends AppState {}
class AppChangSelectRadioButtonFilterHouses extends AppState {}
class AppChangSelectFilterHousesdirection extends AppState {}
class AppChangSelectRadioButtonFilterCars extends AppState {}
class AppChangSelectRadioButtonFilterCars2 extends AppState {}
class AppChangSelectRadioButtonCars extends AppState {}
class AppChangSelectRadioButtonLands extends AppState {}
class AppChangSelectRadioButtonFilterLands extends AppState {}
class AppErrorPostFilterHouses extends AppState {}
class AppSuccessfulFilterHouses  extends AppState {}
class AppLoadingFilterHouses  extends AppState {}
class AppChangSelectFilterHousesFloor extends AppState{}
class AppChangSelectFilterHousesMinRoom extends AppState{}
class AppChangSelectFilterHousesMaxRoom extends AppState{}
class LoginLoadingState extends AppState{}
class AppChangIconVisib2 extends AppState{}

class AppCheckSqure extends AppState{}