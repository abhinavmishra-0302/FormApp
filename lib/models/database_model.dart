class Info{
  final String name;
  final String lastName;
  final String mobile;
  final String product;
  final String eMail;

  Info({required this.name, required this.lastName, required this.mobile, required this.eMail, required this.product});

  Info.fromMap(Map<String, dynamic> item):
     name = item["name"], lastName = item["lastName"], mobile = item["mobile"], product = item["product"], eMail = item["e_mail"];

  Map<String, Object> toMap(){
    return {"name":name,"lastName": lastName, "mobile": mobile, "product": product, "e_mail": eMail};
  }
}