import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/crypto/crypto_cubit.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/crypto/crypto_state.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/order_book/order_book_cubit.dart';
import 'package:flutter_bloc_dr/feature/presentation/bloc/order_book/order_book_state.dart';
import 'package:flutter_bloc_dr/feature/presentation/ui/home/widgets/currency_details/currency_details_container.dart';
import 'package:flutter_bloc_dr/feature/presentation/ui/home/widgets/order_book/order_book_item_row.dart';
import 'package:flutter_bloc_dr/feature/presentation/ui/home/widgets/order_book/order_book_item_title.dart';
import 'package:flutter_bloc_dr/feature/presentation/ui/home/widgets/search_currency_placeholder.dart';
import 'package:flutter_bloc_dr/utils/app_color.dart';
import 'package:flutter_bloc_dr/utils/app_image.dart';
import 'package:flutter_bloc_dr/utils/app_utils.dart';
import 'package:flutter_bloc_dr/widgets/custom_loader.dart';
import 'package:flutter_bloc_dr/widgets/custom_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  CryptoCubit? _cryptoCubit;
  OrderBookCubit? _orderBookCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _cryptoCubit = BlocProvider.of<CryptoCubit>(context);
    _orderBookCubit = BlocProvider.of<OrderBookCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CryptoCubit, CryptoState>(
        bloc: _cryptoCubit,
        builder: (BuildContext context, CryptoState state) {
          if (state is CryptoErrorState) {
            return Scaffold(body: Center(child: Text(state.error)));
          } else if (state is CryptoInitState || state is CryptoLoadedState) {
            return Scaffold(
              floatingActionButton: Visibility(
                  visible: state is CryptoLoadedState,
                  child: FloatingActionButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        final keyword =
                            searchController.text.toLowerCase().trim();

                        if (keyword.length > 5 && keyword.length <= 8) {
                          _cryptoCubit?.fetchCryptoCurrency(keyword);
                        } else {
                          searchController.clear();
                          _cryptoCubit?.fetchCryptoCurrency('btcusd');
                        }
                      },
                      backgroundColor: AppColor.darkPurpleTextColor,
                      child: Image.asset(AppImage.imgRecycle,
                          color: AppColor.whiteColor, height: 24, width: 24))),
              body: SafeArea(
                child: Column(
                  children: [
                    CustomSearch(
                        searchController: searchController,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          final keyword =
                              searchController.text.toLowerCase().trim();

                          if (keyword.length > 5 && keyword.length <= 8) {
                            _cryptoCubit?.fetchCryptoCurrency(keyword);
                          } else {
                            AppUtils.showSnackBar(
                                context, 'Please enter a valid currency pair.');
                          }
                        }),
                    Visibility(
                        visible: state is CryptoInitState,
                        child: const SearchCurrencyPlaceholder()),
                    if (state is CryptoLoadedState)
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CurrencyDetailsContainer(
                                  cryptoCurrencyResponse:
                                      state.cryptoCurrencyResponse),
                              BlocBuilder<OrderBookCubit, OrderBookState>(
                                bloc: _orderBookCubit,
                                builder: (BuildContext context,
                                    OrderBookState orderBookState) {
                                  return Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: orderBookState.isLoading
                                              ? const CustomLoader()
                                              : GestureDetector(
                                                  onTap: () {
                                                    _cryptoCubit?.toggleOrderBook(
                                                        state
                                                            .cryptoCurrencyResponse,
                                                        !state.isHidden);
                                                    if (state.isHidden) {
                                                      _orderBookCubit
                                                          ?.fetchOrderBook(
                                                              searchController
                                                                  .text
                                                                  .toLowerCase()
                                                                  .trim());
                                                    } else {
                                                      _orderBookCubit
                                                          ?.toggleOrderBook();
                                                    }
                                                  },
                                                  child: Text(
                                                      state.isHidden
                                                          ? "VIEW ORDER BOOK"
                                                          : "HIDE ORDER BOOK",
                                                      style: const TextStyle(
                                                          color: AppColor
                                                              .darkPurpleTextColor,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight
                                                              .w600)))),
                                      const SizedBox(height: 20),
                                      if (orderBookState
                                          is OrderBookLoadedState)
                                        Visibility(
                                          visible: !state.isHidden &&
                                              !orderBookState.isLoading,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("ORDER BOOK",
                                                  style: TextStyle(
                                                      color: AppColor
                                                          .greyTextColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Card(
                                                margin: const EdgeInsets.only(
                                                    top: 4, bottom: 20),
                                                elevation: 5,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 16,
                                                      vertical: 12),
                                                  child: Column(
                                                    children: [
                                                      const OrderBookItemTitle(),
                                                      const SizedBox(height: 8),
                                                      ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: orderBookState
                                                                  .orderBookResponse
                                                                  ?.orderBookModel
                                                                  ?.bids
                                                                  ?.length ??
                                                              0,
                                                          itemBuilder:
                                                              (context, index) {
                                                            final item = orderBookState
                                                                    .orderBookResponse
                                                                    ?.orderBookModel
                                                                    ?.bids?[index] ??
                                                                [];

                                                            return OrderBookItemRow(
                                                                item: item);
                                                          })
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }

          return const Scaffold(body: Center(child: CustomLoader()));
        },
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
