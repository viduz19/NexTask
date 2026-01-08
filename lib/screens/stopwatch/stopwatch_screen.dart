import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/stopwatch_provider.dart';

class StopwatchScreen extends StatelessWidget {
  const StopwatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Timer'),
      ),
      body: Consumer<StopwatchProvider>(
        builder: (context, stopwatch, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(48),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).primaryColor, width: 4),
                  ),
                  child: Text(
                    stopwatch.formattedTime,
                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: stopwatch.isRunning ? stopwatch.pause : stopwatch.start,
                      child: Icon(stopwatch.isRunning ? Icons.pause : Icons.play_arrow),
                    ),
                    const SizedBox(width: 24),
                    FloatingActionButton(
                      onPressed: stopwatch.stop,
                      backgroundColor: Colors.redAccent,
                      child: const Icon(Icons.stop),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
