class LoginModel {
  String? status;
  String? message;
  LoginData? data;
  num? code;

  LoginModel({this.status, this.message, this.data, this.code});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    data = json['Data'] != null ? new LoginData.fromJson(json['Data']) : null;
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Code'] = this.code;
    return data;
  }
}

class LoginData {
  bool? isActive;
  String? sId;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  UserType? userType;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? token;

  LoginData(
      {this.isActive,
        this.sId,
        this.username,
        this.email,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.userType,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.token});

  LoginData.fromJson(Map<String, dynamic> json) {
    isActive = json['isActive'];
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    userType = json['userType'] != null
        ? new UserType.fromJson(json['userType'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isActive'] = this.isActive;
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    if (this.userType != null) {
      data['userType'] = this.userType!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['token'] = this.token;
    return data;
  }
}

class UserType {
  String? sId;
  String? name;

  UserType({this.sId, this.name});

  UserType.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
