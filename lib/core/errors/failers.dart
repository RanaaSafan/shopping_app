abstract class failers{
  final String error;

  failers({required this.error});



}

class server_error extends failers{
  server_error({required super.error});

}