// ignore_for_file: public_member_api_docs, sort_constructors_first
class FilterModel {
  int id;
  String name;
  FilterModel({
    required this.id,
    required this.name,
  });

  static List<FilterModel> filterList = [
    FilterModel(id: 1, name: "All"),
    FilterModel(id: 2, name: "WTF Exclusive"),
    FilterModel(id: 3, name: "WTF Co-Branded"),
    FilterModel(id: 4, name: "WTF Power"),
  ];
}
