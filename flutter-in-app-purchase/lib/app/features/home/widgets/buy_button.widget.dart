import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app/app/core/models/product.model.dart';
import 'package:in_app/app/core/services/in_app_purchase.service.dart';
import 'package:in_app/app/core/states/payment.state.dart';

class BuyButton extends HookConsumerWidget {
  const BuyButton(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final purchaseStatus = ref.watch(productPurchasedStatusProvider(product.productId));
    final productDetail = useState<ProductDetails?>(null);

    useEffect(
      () {
        Future.microtask(() async {
          final response = await ref.read(inAppPurchaseServiceprovider).getProductsDetails({product.productId});

          if (response != null && response.isNotEmpty) {
            productDetail.value = response.first;
          }
        });
        return;
      },
      [product],
    );

    Future<void> executePurchase() async {
      if (purchaseStatus != PaymentPurchaseStatus.pending) {
        if (productDetail.value != null) {
          await ref.read(inAppPurchaseServiceprovider).purchase(product, productDetail.value!);
        }
      }
      return;
    }

    return ElevatedButton(
      onPressed: executePurchase,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Buy', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: 10),
          if (productDetail.value != null)
            Text('${productDetail.value?.price}', style: Theme.of(context).textTheme.titleSmall)
          else
            const Center(child: CircularProgressIndicator(color: Colors.red)),
        ],
      ),
    );
  }
}
