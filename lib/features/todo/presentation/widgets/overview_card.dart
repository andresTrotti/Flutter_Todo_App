import 'package:flutter/material.dart';


class OverviewCard extends StatelessWidget{
  const OverviewCard({super.key, required this.completedCount, required this.totalTodosCount});
  final int completedCount;
  final int totalTodosCount;



  @override
  Widget build(BuildContext context){

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Card(
        color: theme.cardColor.withAlpha(100),
        child: Padding(padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    Text("Todo Progress",
                      style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 4),
                    Text( completedCount > 0 ? "Keep going!" : "Complete your first task",
                      style: textTheme.bodyMedium?.copyWith(
                        color: theme.hintColor,
                      ),

                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text("$completedCount/$totalTodosCount", style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold)
                ),
              ),

            ],
          ),
        )
    );
  }

}