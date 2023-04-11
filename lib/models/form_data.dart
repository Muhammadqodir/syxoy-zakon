class FormDataModel{
  final bool isValid;
  final String message;
  final dynamic data;

  FormDataModel({required this.data, this.isValid = true, this.message = "ok"});

  FormDataModel.inValid({required this.message, this.isValid=false, this.data});
}