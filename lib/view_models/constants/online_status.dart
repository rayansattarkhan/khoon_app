enum OnlineStatus {
  online,
  lastSeen,
  offline
}

class CurrentOnlineStatus {
  OnlineStatus currentStatus;

  CurrentOnlineStatus({required this.currentStatus});

  CurrentOnlineStatus.online() : currentStatus = OnlineStatus.online;
  CurrentOnlineStatus.lastSeen() : currentStatus = OnlineStatus.lastSeen;
  CurrentOnlineStatus.offline() : currentStatus = OnlineStatus.offline;
}