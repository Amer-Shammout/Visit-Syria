import 'package:equatable/equatable.dart';

class Media extends Equatable {
  final int? id;
  final String? url;

  const Media({this.id, this.url});

  factory Media.fromJson(Map<String, dynamic> json) =>
      Media(id: json['id'] as int?, url: json['url'] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'url': url};

  @override
  List<Object?> get props => [id, url];
}
