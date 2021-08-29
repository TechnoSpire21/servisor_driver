part of 'models.dart';

class Drivers extends Equatable {
  final String driverId;
  final String name;
  final String email;
  final String password;
  final String confirmpass;
  final String telp;
  final String foto;
  final String createdAt;
  final String updatedAt;

  Drivers(
    this.driverId,
    this.name,
    this.email,
    this.password,
    this.confirmpass,
    this.telp,
    this.foto,
    this.createdAt,
    this.updatedAt,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
        driverId,
        name,
        email,
        password,
        confirmpass,
        telp,
        foto,
        createdAt,
        updatedAt,
      ];
}
