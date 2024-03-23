import 'package:flutter/material.dart';

class AddressRow extends StatelessWidget {
  final String address;
  const AddressRow({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          size: 25,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(address),
      ],
    );
  }
}
