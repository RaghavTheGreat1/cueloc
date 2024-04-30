import 'package:freezed_annotation/freezed_annotation.dart';

part 'ringtone.freezed.dart';
part 'ringtone.g.dart';

@freezed
class Ringtone with _$Ringtone {
  factory Ringtone({
    required String id,
    required String title,
    required String uri,
  }) = _Ringtone;

  factory Ringtone.fromJson(Map<String, dynamic> json) =>
      _$RingtoneFromJson(json);
}
