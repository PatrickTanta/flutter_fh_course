import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.tertiary
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(text, style: TextStyle(color: colors.onPrimary)),
          ),
        ),

        SizedBox(height: 5,),

        // toto image
        _ImageBubble(),

        SizedBox(height: 5,),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), 
      child: Image.network("https://yesno.wtf/assets/yes/1-af11222d8d4af90bdab8fc447c8cfebf.gif", fit: BoxFit.cover, height: 150, width: size.width * 0.7,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(child: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(strokeWidth: 3),
        ));
      },
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Icon(Icons.error, color: Color.fromARGB(255, 255, 212, 209),));
      },)
    );
  }
}