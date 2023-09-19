// ignore_for_file: public_member_api_docs, sort_constructors_first
class FilterModel {
  int id;
  String name;
  String code;
  FilterModel({
    required this.id,
    required this.name,
    required this.code,
  });

  static List<FilterModel> filterList = [
    FilterModel(id: 1, name: "All", code: ""),
    FilterModel(id: 2, name: "WTF Exclusive", code: "Exclusive"),
    FilterModel(id: 3, name: "WTF Co-Branded", code: "Branded"),
    FilterModel(id: 4, name: "WTF Powered", code: "Powered"),
  ];
}
