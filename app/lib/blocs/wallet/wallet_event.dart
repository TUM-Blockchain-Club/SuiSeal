part of 'wallet_bloc.dart';

abstract class WalletEvent {}

class WalletConnect extends WalletEvent {}

class WalletDisconnect extends WalletEvent {}
