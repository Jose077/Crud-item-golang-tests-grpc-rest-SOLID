class User {
  int userId;
  String userName, userEmail, userPhone, userWebsite;
  UserAddress userAddress;
  UserCompany userCompany;
  User(
      {required this.userId,
      required this.userName,
      required this.userEmail,
      required this.userPhone,
      required this.userWebsite,
      required this.userAddress,
      required this.userCompany});

  factory User.fromJSON(Map<String, dynamic> parsedJson) {
    return User(
      userId: parsedJson['id'],
      userName: parsedJson['name'],
      userEmail: parsedJson['email'],
      userPhone: parsedJson['phone'],
      userWebsite: parsedJson['website'],
      userAddress: UserAddress.fromJSON(parsedJson['address']),
      userCompany: UserCompany.fromJSON(parsedJson['company']),
    );
  }
}

class UserAddress {
  String userStreet, userSuite, userCity, userZipCode;

  UserAddress(
      {required this.userStreet,
      required this.userSuite,
      required this.userCity,
      required this.userZipCode});

  factory UserAddress.fromJSON(Map<String, dynamic> parsedJson) {
    return UserAddress(
      userStreet: parsedJson['street'],
      userSuite: parsedJson['suite'],
      userCity: parsedJson['city'],
      userZipCode: parsedJson['zipcode'],
    );
  }
}

class UserCompany {
  String name, catchPhrase, bs;

  UserCompany(
      {required this.name, required this.catchPhrase, required this.bs});

  factory UserCompany.fromJSON(Map<String, dynamic> parsedJson) {
    return UserCompany(
        name: parsedJson['name'],
        catchPhrase: parsedJson['catchPhrase'],
        bs: parsedJson['bs']);
  }
}
