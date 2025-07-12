import 'package:flutter/material.dart';

class BellPepperItemCard extends StatelessWidget {
  const BellPepperItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Bell Pepper Image
          Image.asset(
            'assets/images/bell_pepper.png', // Replace with your actual asset path
            width: 60,
            height: 60,
            fit: BoxFit.contain,
          ),

          const SizedBox(width: 12),

          // Title and Quantity Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bell Pepper Red',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                const Text(
                  '1kg, Price',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),

                // Quantity control row
                Row(
                  children: [
                    _buildCounterButton(Icons.remove),
                    const SizedBox(width: 8),
                    const Text('1', style: TextStyle(fontSize: 16)),
                    const SizedBox(width: 8),
                    _buildCounterButton(Icons.add, isAdd: true),
                  ],
                ),
              ],
            ),
          ),

          // Price and Close Button
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.close, size: 20, color: Colors.grey),
              const SizedBox(height: 24),
              const Text(
                '\$4.99',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, {bool isAdd = false}) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 18, color: isAdd ? Colors.green : Colors.black54),
    );
  }
}
