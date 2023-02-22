class AddressResModel {
  List<ViewDetailData>? viewdetaildata;

  AddressResModel({this.viewdetaildata});

  AddressResModel.fromJson(Map<String, dynamic> json) {
    if (json['viewdetaildata'] != null) {
      viewdetaildata = <ViewDetailData>[];
      json['viewdetaildata'].forEach((v) {
        viewdetaildata!.add(new ViewDetailData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.viewdetaildata != null) {
      data['viewdetaildata'] = this.viewdetaildata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViewDetailData {
  int? id;
  int? bookingId;
  String? poojaTitle;
  String? poojaDate;
  String? address;
  String? country;
  String? statename;
  String? cityname;
  int? pinCode;
  int? panditId;
  String? bookingPujaDate;
  int? bookingPaidAmount;
  String? orderId;
  String? pujaMode;
  String? pujaLanguage;
  String? pujaDuration;
  String? name;
  String? email;
  String? phone;
  List<dynamic>? sbdetail;

  ViewDetailData(
      {this.id,
      this.bookingId,
      this.poojaTitle,
      this.poojaDate,
      this.address,
      this.country,
      this.statename,
      this.cityname,
      this.pinCode,
      this.panditId,
      this.bookingPujaDate,
      this.bookingPaidAmount,
      this.orderId,
      this.pujaMode,
      this.pujaLanguage,
      this.pujaDuration,
      this.name,
      this.email,
      this.phone,
      this.sbdetail});

  ViewDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    poojaTitle = json['pooja_title'];
    poojaDate = json['pooja_date'];
    address = json['address'];
    country = json['country'];
    statename = json['statename'];
    cityname = json['cityname'];
    pinCode = json['pin_code'];
    panditId = json['pandit_id'];
    bookingPujaDate = json['booking_puja_date'];
    bookingPaidAmount = json['booking_paid_amount'];
    orderId = json['order_id'];
    pujaMode = json['puja_mode'];
    pujaLanguage = json['puja_language'];
    pujaDuration = json['puja_duration'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    if (json['sbdetail'] != null) {
      sbdetail = <Null>[];
      json['sbdetail'].forEach((v) {
        sbdetail!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['pooja_title'] = this.poojaTitle;
    data['pooja_date'] = this.poojaDate;
    data['address'] = this.address;
    data['country'] = this.country;
    data['statename'] = this.statename;
    data['cityname'] = this.cityname;
    data['pin_code'] = this.pinCode;
    data['pandit_id'] = this.panditId;
    data['booking_puja_date'] = this.bookingPujaDate;
    data['booking_paid_amount'] = this.bookingPaidAmount;
    data['order_id'] = this.orderId;
    data['puja_mode'] = this.pujaMode;
    data['puja_language'] = this.pujaLanguage;
    data['puja_duration'] = this.pujaDuration;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    if (this.sbdetail != null) {
      data['sbdetail'] = this.sbdetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
