import 'package:bloc/bloc.dart';
import 'package:sui/sui.dart';
import 'package:tbcxsui/repositories/repository_wallet.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository walletRepository;

  WalletBloc({required this.walletRepository}) : super(WalletInitial()) {
    on<WalletConnect>((event, emit) async {
      await walletRepository.connect();
      emit(WalletConnected(walletRepository.account, walletRepository.client));
    });

    on<WalletDisconnect>((event, emit) async {
      await walletRepository.disconnect();
      emit(WalletInitial());
    });
  }
}
