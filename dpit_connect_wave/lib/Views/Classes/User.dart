class User {
  String _name = '';
  int _rating = 0;
  int _activicompleted = 0;
  int _friends = 0;
  String _favcategory = '';
  String _about = '';
  List<String> _interests = [];
  List<String> _tags = [];
  List<String> _friends_list = [];

  User(
      {required name,
      required rating,
      required activicompleted,
      required friends,
      required favcategory,
      required about,
      required interests,
      required tags,
      required friends_list})
      : _name = name,
        _rating = rating,
        _activicompleted = activicompleted,
        _friends = friends,
        _favcategory = favcategory,
        _about = about,
        _interests = interests,
        _tags = tags,
        _friends_list = friends_list;

  List<String> get friends_list => _friends_list;

  set friends_list(List<String> value) {
    _friends_list = value;
  }

  String get name => _name;

  List<String> get tags => _tags;

  List<String> get interests => _interests;

  String get about => _about;

  String get favcategory => _favcategory;

  int get friends => _friends;

  int get activicompleted => _activicompleted;

 int get rating => _rating;

  set tags(List<String> value) {
    _tags = value;
  }

  set interests(List<String> value) {
    _interests = value;
  }

  set about(String value) {
    _about = value;
  }

  set favcategory(String value) {
    _favcategory = value;
  }

  set friends(int value) {
    _friends = value;
  }

  set activicompleted(int value) {
    _activicompleted = value;
  }

  set rating(int value) {
    _rating = value;
  }

  set name(String value) {
    _name = value;
  }
}
