


// Initial State Values
class VygodaState {
  // Authentication state values
  final String errMsg;
  final bool isAuthenticated;
  final bool regLoading;
  final bool logLoading;
  final dynamic user;
  final List<dynamic> allUsers;

  // Vygoda State values
  final String activeUser;
  final String activeRoom;

  // Vygoda State values
  // final String activeUser;
  final List<Map<String, dynamic>> codeMsgList;

  // Vygoda State Constructor
  VygodaState({
    required this.errMsg,
    required this.isAuthenticated,
    required this.regLoading,
    required this.logLoading,
    this.user,
    required this.allUsers,
    required this.activeUser,
    required this.activeRoom,
    required this.codeMsgList,
  });
/*
  VygodaState copyWith({errMsg, required bool isAuthenticated, dynamic user,
    required List<dynamic> allUsers, required String activeUser, required String activeRoom,
    required List<Map<String, dynamic>>codeMsgList}) {
    return VygodaState(
      errMsg: errMsg ?? this.errMsg,
      allUsers: allUsers ?? this.allUsers,
      activeUser: activeUser ?? this.activeUser,
      activeRoom: activeRoom ?? this.activeRoom,
      user: user ?? this.user,
    )
  };
  */
}

// Authentication Reducer


// Combine Reducer