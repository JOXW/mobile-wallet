import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:securus_wallet/walletbackend/DaemonConnection.dart';
import 'package:securus_wallet/walletbackend/DaemonType.dart';


class Daemon {

    var logger = Logger(
  printer: PrettyPrinter(),
);

    final String host;
    final int port;
    final bool useSSL;
    //Conventional Daemon or blockchain cache API
    final bool isCacheApi;
    String feedNodeAdress;
    double feeAmount;
    int localDaemonBlockCount;
    int networkBlockCount;
    int peerCount;
    double lastKnownHashrate;
    DateTime lastUpdatedNetworkHeight = DateTime.now();
    DateTime lastUpdatedLocalHeight = DateTime.now();
    bool connected = true;

    Daemon({@required this.host, @required this.port, this.useSSL = false, this.isCacheApi = false});

    Future<void> init() async {

    }

    // Future<void> updateDaemonInfo() {
    //     var info;

    //     try {
    //         info = await this.makeGetRequest('/info');
    //     } catch (err) {
    //         logger.d(
    //             'Failed to update daemon info: ' + err.toString(),
    //         );

    //         var diff1 = ((DateTime.now().millisecondsSinceEpoch-(lastUpdatedNetworkHeight.millisecondsSinceEpoch) )/ 1000);
    //         var diff2 = ((DateTime.now().millisecondsSinceEpoch-(lastUpdatedLocalHeight.millisecondsSinceEpoch)) / 1000);

    //         if (diff1 > this.config.maxLastUpdatedNetworkHeightInterval
    //          || diff2 > this.config.maxLastUpdatedLocalHeightInterval) {
    //            throw DeadNodeException();
    //         }

    //     }

       
    //     /* Height returned is one more than the current height - but we
    //        don't want to overflow if the height returned is zero */
    //     if (info.network_height != 0) {
    //         info.network_height--;
    //     }

    //     if (this.localDaemonBlockCount != info.height 
    //      || this.networkBlockCount != info.network_height) {
    //         this.emit('heightchange', info.height, info.network_height);

    //         this.lastUpdatedNetworkHeight = new Date();
    //         this.lastUpdatedLocalHeight = new Date();
    //     } else {
    //         var diff1 = ((DateTime.now().millisecondsSinceEpoch-(lastUpdatedNetworkHeight.millisecondsSinceEpoch) )/ 1000);
    //         var diff2 = ((DateTime.now().millisecondsSinceEpoch-(lastUpdatedLocalHeight.millisecondsSinceEpoch)) / 1000);

    //         if (diff1 > this.config.maxLastUpdatedNetworkHeightInterval
    //          || diff2 > this.config.maxLastUpdatedLocalHeightInterval) {
    //             throw new DeadNodeException();
    //         }
    //     }

    //     this.localDaemonBlockCount = info.height;
    //     this.networkBlockCount = info.network_height;
        
    //     this.peerCount = info.incoming_connections_count + info.outgoing_connections_count;

    //     this.lastKnownHashrate = info.difficulty / this.config.blockTargetTime;
    // }

    // Future<List<Block>> getWalletSyncData(List<String> blockHashChechpoints, int startHeight, int startTimestamp, int blockCount)async{

    //     var data;

    //     try {
    //         data = await this.makePostRequest('/getwalletsyncdata', {
    //             blockCount,
    //             blockHashChechpoints,
    //             skipCoinbaseTransactions: !this.config.scanCoinbaseTransactions,
    //             startHeight,
    //             startTimestamp,
    //         });
    //     } catch (err) {
    //         return[];
    //     }

    //     /* The node is not dead if we're fetching blocks. */
    //     if (data.items.length >= 0) {
    //         this.lastUpdatedNetworkHeight = DateTime.now();
    //         this.lastUpdatedLocalHeight = DateTime.now();
    //     }

    //     if (data.synced && data.topBlock && data.topBlock.height && data.topBlock.hash) {
    //         return data.items.map((b) => Block.fromJson(b));
    //     }

    //     return data.items.map((b) => Block.fromJson(b));
    // }

    /**
     * @returns Returns a mapping of transaction hashes to global indexes
     *
     * Get global indexes for the transactions in the range
     * [startHeight, endHeight]
     */
    // public async getGlobalIndexesForRange(
    //     startHeight: number,
    //     endHeight: number): Promise<Map<string, number[]>> {

    //     if (this.isCacheApi) {
    //         throw new Error(
    //             'This call is not supported on the cache api. The cache API ' +
    //             'returns global indexes directly from /getWalletSyncData',
    //         );
    //     }

    //     try {
    //         const data = await this.makePostRequest('/get_global_indexes_for_range', {
    //             startHeight,
    //             endHeight,
    //         });

    //         const indexes: Map<string, number[]> = new Map();

    //         for (const index of data.indexes) {
    //             indexes.set(index.key, index.value);
    //         }

    //         return indexes;
    //     } catch (err) {
    //         logger.log(
    //             'Failed to get global indexes: ' + err.toString(),
    //             LogLevel.ERROR,
    //             LogCategory.DAEMON,
    //         );

    //         return new Map();
    //     }
    // }

    // Future<List<String>> getCancelledTransactions(List<String> transactionHashes)async {
    //     try {
    //         var data = await this.makePostRequest('/get_transactions_status', {
    //             json.encode(transactionHashes),
    //         });

    //         return data.transactionsUnknown ?? [];
    //     } catch (err) {

    //         return [];
    //     }
    // }

    /**
     * Gets random outputs for the given amounts. requestedOuts per. Usually mixin+1.
     *
     * @returns Returns an array of amounts to global indexes and keys. There
     *          should be requestedOuts indexes if the daemon fully fulfilled
     *          our request.
     */
    // Future<List<double> getRandomOutputsByAmount(
    //     List<double> amounts,
    //     double requestedOuts) async {

    //     var data = [];

    //     try {
    //         if (this.isCacheApi) {
    //             data = await this.makePostRequest('/randomOutputs', {
    //                 'amounts': amounts,
    //                 'mixin': requestedOuts,
    //             });
    //         } else {
    //             var tmp = await this.makePostRequest('/getrandom_outs', {
    //                 'amounts': amounts,
    //                 'outs_count': requestedOuts,
    //             });

    //             data = tmp.outs;
    //         }
    //     } catch (err) {
           

    //         return [];
    //     }


    //     for (var output of data) {
    //         const indexes: Array<[number, string]> = [];

    //         for (const outs of output.outs) {
    //             indexes.push([outs.global_amount_index, outs.out_key]);
    //         }

    //         /* Sort by output index to make it hard to determine real one */
    //         outputs.push([output.amount, _.sortBy(indexes, ([index, key]) => index)]);
    //     }

    //     return outputs;
    // }

    Future<void> sendTransaction(String rawTransaction) async {
        var result = await this.makePostRequest('/sendrawtransaction', json.encode(rawTransaction));

        /* Success. */
        if (!(result.status.toUpperCase() == 'OK')) {
            throw new SendTransactionFailedException();
                    }
                }
            
                DaemonConnection getConnectionInfo() {
                        return DaemonConnection(
                            host: this.host,
                            port: this.port,
                            daemonType: this.isCacheApi ? DaemonType.BlockchainCacheApi : DaemonType.Conventional,
                            useSSL: this.useSSL
                        );
                    }
                
                 
                    Future<void> updateFeeInfo() async {
                        var feeInfo;
                
                        try {
                            feeInfo = await this.makeGetRequest('/fee');
                        } catch (err) {
                            return;
                        }
                
                        if (feeInfo.address == '') {
                            return;
                        }
                
                        //Validiere Wallet Adresse Siehe .ValidateParameters
                
                        if (feeInfo.amount > 0) {
                            this.feedNodeAdress = feeInfo.address;
                            this.feeAmount = feeInfo.amount;
                        }
                    }
                
                    Future<dynamic> makeGetRequest(String endpoint) async {
                        return await http.get(endpoint, headers: {'Content-type': 'application/json', 'User-Agent': "SecurusMobileWallet" } );
                    }
                
                    /**
                     * Makes a get request to the given endpoint
                     */
                    Future<dynamic> makePostRequest(String endpoint, String jsonBody) async {
                        try {
                
                
                            var response = await http.Client().post(endpoint, headers: {'Content-type': 'application/json', 'User-Agent': "SecurusMobileWallet" }, body: jsonBody, );
                
                            return response;
                        } catch (err) {
                           
                            }
                            
                    }
                }
            
            class SendTransactionFailedException {
}
    

class DeadNodeException {
}