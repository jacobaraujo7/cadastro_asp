sealed class ClientEditState {
  const ClientEditState();
}

class StartEditClientState extends ClientEditState {
  const StartEditClientState();
}

class SavedClientState extends ClientEditState {
  const SavedClientState();
}

class LoadingEditClientState extends ClientEditState {
  const LoadingEditClientState();
}

class FailureEditClientState extends ClientEditState {
  final String message;
  const FailureEditClientState(this.message);
}
