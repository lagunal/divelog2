import 'package:divelog2/src/features/data/local/app_database.dart';
import 'package:divelog2/src/features/data/local/tables/dive_sessions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiveSessionCard extends StatelessWidget {
  final DiveSession session;
  final VoidCallback? onTap;

  const DiveSessionCard({super.key, required this.session, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      session.location,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0077BE),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(session.date),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (session.diveOperator != null &&
                  session.diveOperator!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.business,
                        size: 16,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        session.diveOperator!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              Row(
                children: [
                  _buildInfoChip(Icons.south, '${session.maxDepth}m'),
                  const SizedBox(width: 12),
                  _buildInfoChip(Icons.timer, '${session.bottomTime} min'),
                  const Spacer(),
                  if (session.syncStatus == SyncStatus.synced)
                    const Icon(Icons.cloud_done, size: 18, color: Colors.green)
                  else
                    const Icon(
                      Icons.cloud_upload,
                      size: 18,
                      color: Colors.orange,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 16, color: _AppColors.slateGrey),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: _AppColors.slateGrey,
          ),
        ),
      ],
    );
  }
}

class _AppColors {
  static const slateGrey = Color(0xFF64748B);
}