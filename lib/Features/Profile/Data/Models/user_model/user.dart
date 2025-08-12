import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? email;
  final DateTime? emailVerifiedAt;
  final int? isVerified;
  final dynamic verificationCode;
  final String? verificationCodeSentAt;
  final int? verificationAttempts;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const User({
    this.id,
    this.email,
    this.emailVerifiedAt,
    this.isVerified,
    this.verificationCode,
    this.verificationCodeSentAt,
    this.verificationAttempts,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    email: json['email'] as String?,
    emailVerifiedAt:
        json['email_verified_at'] == null
            ? null
            : DateTime.parse(json['email_verified_at'] as String),
    isVerified: json['is_verified'] as int?,
    verificationCode: json['verification_code'] as dynamic,
    verificationCodeSentAt: json['verification_code_sent_at'] as String?,
    verificationAttempts: json['verification_attempts'] as int?,
    status: json['status'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'email_verified_at': emailVerifiedAt?.toIso8601String(),
    'is_verified': isVerified,
    'verification_code': verificationCode,
    'verification_code_sent_at': verificationCodeSentAt,
    'verification_attempts': verificationAttempts,
    'status': status,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      email,
      emailVerifiedAt,
      isVerified,
      verificationCode,
      verificationCodeSentAt,
      verificationAttempts,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
