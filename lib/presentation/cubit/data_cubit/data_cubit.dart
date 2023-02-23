import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlng/latlng.dart';
import 'package:test_today/core/app_enums.dart';
import 'package:test_today/core/core.dart';
import 'package:test_today/data/model/address_res_model.dart';
import 'package:test_today/data/repository/app_repository.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit()
      : super(const DataState.init(
          isProcessing: false,
          launchStatus: LaunchStatus.loading,
        ));

  void init() async {
    changeLaunchStatus(LaunchStatus.loading);
    await Future.wait([
      fetchCurrentPosition(),
      getData(),
    ]);
    changeLaunchStatus(LaunchStatus.launching);
  }

  void changeLaunchStatus(LaunchStatus status) {
    emit(state.copyWith(
      launchStatus: status,
    ));
  }

  Future<void> fetchCurrentPosition() async {
    final currentLoc = await LocationUtility.fetchLocationData();
    emit(state.copyWith(
      currentPosition: LatLng(
        currentLoc?.latitude ?? 0,
        currentLoc?.longitude ?? 0,
      ),
    ));
    if (currentLoc != null) {
      final address = await LocationUtility.getAddressFromPosition(
        currentLoc.latitude,
        currentLoc.longitude,
      );
      emit(state.copyWith(
        currentAddress: address?.addressLine,
      ));
    }
  }

  Future<void> getData() async {
    final res = await getIt<AppRepository>().postData(
      token: 'RklUTkVTU0AjMTIz',
      id: 'am9uZUAyOTc4',
      data: ({"pandit_id": "7", "booking_id": "843"}),
      postUrlPath: 'api/viewdetail',
    );
    res.fold((l) {}, (r) async {
      final models = AddressResModel.fromJson(r.data);
      emit(state.copyWith(
        data: models,
      ));
      await onAddressFetch();
    });
  }

  Future<void> onAddressFetch() async {
    final desAdd = state.data?.viewdetaildata?.first.address ?? "Lucknow, 226016-Utter Pradesh";
    final position = await LocationUtility.positionFromAddress(desAdd);
    emit(state.copyWith(
      destPosition: position,
      destAddress: desAdd,
    ));
  }
}
