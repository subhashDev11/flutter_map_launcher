part of 'data_cubit.dart';

class DataState extends Equatable {
  final bool isProcessing;
  final AddressResModel? data;
  final LatLng? currentPosition;
  final LatLng? destPosition;
  final String? destAddress;

  const DataState({
    this.currentPosition,
    this.destPosition,
    this.destAddress,
    this.data,
    required this.isProcessing,
  });

  const DataState.init({
    this.currentPosition,
    this.destPosition,
    this.destAddress,
    this.data,
    required this.isProcessing,
  });

  DataState copyWith({
    bool? isProcessing,
    dynamic data,
    LatLng? currentPosition,
    LatLng? destPosition,
    String? destAddress,
  }) {
    return DataState(
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
        destPosition,
        destAddress,
      ];
}
