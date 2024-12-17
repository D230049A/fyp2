import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              'User Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Account',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildDropdownRow('Choose Gender:', ['Male', 'Female', 'Other']),
            const SizedBox(height: 20),
            _buildDropdownRow('Choose Body Type:', ['Slim', 'Athletic', 'Average', 'Heavy']),
            const SizedBox(height: 20),
            _buildDropdownRow('Choose Personal Preferences:', ['Casual', 'Formal', 'Sporty']),
            const SizedBox(height: 20),
            _buildDropdownRow('Choose Race:', ['Asian', 'Black', 'Caucasian', 'Hispanic']),
          ],
        ),
      ),
    );
  }

  static Widget _buildDropdownRow(String label, List<String> options) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 18)),
        DropdownButton<String>(
          items: options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ],
    );
  }
}
