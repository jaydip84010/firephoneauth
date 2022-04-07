class Usermodel {
  var id;
  var name;
  var mobilenumber;
  var password;

  Usermodel({this.id,this.name, this.mobilenumber, this.password});

  Usermodel.frommap(Map<String,dynamic>data):
        id=data['id'],
        name=data['name'],
        mobilenumber=data['mobilenumber'],
        password=data['password'];

  Map<String,dynamic>tomap()=>{
    'id':id,
    'name':name,
    'mobilenumber':mobilenumber,
    'password':password
  };

}
