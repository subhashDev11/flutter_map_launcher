part of 'data_cubit.dart';

class DataState extends Equatable {
  final bool isProcessing;
  final LaunchStatus launchStatus;
  final AddressResModel? data;
  final LatLng? currentPosition;
  final LatLng? destPosition;
  final String? destAddress;
  final String? currentAddress;

  const DataState({
    this.currentPosition,
    this.destPosition,
    this.destAddress,
    this.data,
    this.currentAddress,
    required this.isProcessing,
    required this.launchStatus,
  });

  const DataState.init({
    this.currentPosition,
    this.destPosition,
    this.destAddress,
    this.currentAddress,
    this.data,
    required this.isProcessing,
    required this.launchStatus,
  });

  DataState copyWith({
    bool? isProcessing,
    dynamic data,
    LatLng? currentPosition,
    LatLng? destPosition,
    String? destAddress,
    String? currentAddress,
    LaunchStatus? launchStatus,
  }) {
    return DataState(
      currentAddress: currentAddress ?? this.currentAddress,
      launchStatus: launchStatus ?? this.launchStatus,
      data: data ?? this.data,
      isProcessing: isProcessing ?? this.isProcessing,
      currentPosition: currentPosition ?? this.currentPosition,
      destAddress: destAddress ?? this.destAddress,
      destPosition: destPosition ?? this.destPosition,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        data,
        isProcessing,
        currentPosition,
        currentAddress,
        destPosition,
        destAddress,
        launchStatus,
      ];
}
