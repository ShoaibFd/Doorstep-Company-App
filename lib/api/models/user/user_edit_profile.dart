class UserEditProfile {
  String? message;
  User? user;

  UserEditProfile({this.message, this.user});

  UserEditProfile.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? dateOfBirth;
  String? countryCode;
  String? phoneNumber;
  var location;
  String? city;
  String? area;
  String? street;
  String? apartment;
  var address;
  var profileImage;
  String? otpExpiresAt;
  String? role;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.dateOfBirth,
      this.countryCode,
      this.phoneNumber,
      this.location,
      this.city,
      this.area,
      this.street,
      this.apartment,
      this.address,
      this.profileImage,
      this.otpExpiresAt,
      this.role,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    location = json['location'];
    city = json['city'];
    area = json['area'];
    street = json['street'];
    apartment = json['apartment'];
    address = json['address'];
    profileImage = json['profile_image'];
    otpExpiresAt = json['otp_expires_at'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['location'] = location;
    data['city'] = city;
    data['area'] = area;
    data['street'] = street;
    data['apartment'] = apartment;
    data['address'] = address;
    data['profile_image'] = profileImage;
    data['otp_expires_at'] = otpExpiresAt;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
