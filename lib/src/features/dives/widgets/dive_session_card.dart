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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            session.location,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00B4DB),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.place, 
                                size: 14, 
                                color: isDark ? Colors.white60 : const Color(0xFF64748B)
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  session.diveOperator ?? session.client ?? '', 
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isDark ? Colors.white60 : const Color(0xFF64748B),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      _formatDate(session.date),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white38 : const Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildMetricChip(
                      context,
                      Icons.arrow_downward_rounded,
                      '${session.maxDepth}m',
                    ),
                    const SizedBox(width: 12),
                    _buildMetricChip(
                      context,
                      Icons.timer_outlined,
                      '${session.bottomTime} min',
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (session.syncStatus == SyncStatus.synced 
                            ? const Color(0xFF10B981) // Green
                            : const Color(0xFF00B4DB)) // Blue
                            .withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        session.syncStatus == SyncStatus.synced
                            ? Icons.cloud_done_rounded
                            : Icons.cloud_upload_rounded,
                        size: 20,
                        color: session.syncStatus == SyncStatus.synced
                            ? const Color(0xFF10B981)
                            : const Color(0xFF00B4DB),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetricChip(BuildContext context, IconData icon, String label) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: const Color(0xFF00B4DB),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : const Color(0xFF334155),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final checkDate = DateTime(date.year, date.month, date.day);

    if (checkDate == today) {
      return 'HOY, ${DateFormat('HH:mm').format(date)}';
    } else if (checkDate == yesterday) {
      return 'AYER, ${DateFormat('HH:mm').format(date)}';
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }
}