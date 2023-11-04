import 'package:gestion_inventario/features/home/domain/domain.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });
  // Solo para al dependencia de http
  // factory YesNoModel.fromJson(String str) =>
  //     YesNoModel.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory YesNoModel.fromMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };
  Message toMesageEntity() => Message(
        text: answer == 'yes'
            ? 'Sí'
            : answer == 'no'
                ? 'No'
                : 'Tal vez',
        fromWho: FromWho.hers,
        imageUrl: image,
      );
}
