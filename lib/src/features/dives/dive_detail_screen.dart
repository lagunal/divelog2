import 'package:divelog2/src/features/data/local/app_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiveDetailScreen extends StatelessWidget {
  final DiveSession session;

  const DiveDetailScreen({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Inmersión'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Navigate to Edit
            },
          ),
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () {
              // TODO: Implement PDF Export
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildSection('Información General', [
              _buildDetailRow('Lugar', session.location),
              _buildDetailRow('Cliente', session.client),
              _buildDetailRow('Operadora', session.diveOperator),
              _buildDetailRow('Dirección Op.', session.operatorAddress),
              _buildDetailRow('Tipo', session.diveType),
              _buildDetailRow('Buzos', session.diversNames),
            ]),
            const SizedBox(height: 16),
            _buildSection('Detalles de la Sesión', [
              _buildDetailRow('Hora Entrada', _formatTime(session.entryTime)),
              _buildDetailRow('Hora Salida', _formatTime(session.exitTime)),
              _buildDetailRow('Prof. Máxima', '${session.maxDepth} m'),
              _buildDetailRow('Tiempo Fondo', '${session.bottomTime} min'),
              _buildDetailRow('Int. Superficie', session.surfaceInterval != null ? '${session.surfaceInterval} min' : null),
              _buildDetailRow('Tiempo Total', session.totalDiveTime != null ? '${session.totalDiveTime} min' : null),
            ]),
            const SizedBox(height: 16),
            _buildSection('Descompresión', [
              _buildDetailRow('Inicio', _formatTime(session.decompressionStart)),
              _buildDetailRow('Fin', _formatTime(session.decompressionComplete)),
              _buildDetailRow('Utilizada', session.decompressionUsed),
            ]),
            const SizedBox(height: 16),
            _buildSection('Técnico y Trabajo', [
              _buildDetailRow('Mezcla', session.gasMixture),
              _buildDetailRow('Descripción', session.workDescription),
              _buildDetailRow('Enfermedad/Lesión', session.illnessOrInjury),
              _buildDetailRow('Supervisor', session.diveSupervisor),
            ]),
            const SizedBox(height: 16),
            _buildSection('Tiempos Acumulados', [
              _buildDetailRow('Supervisión', session.accumulatedSupervisionTime != null ? '${session.accumulatedSupervisionTime} min' : null),
              _buildDetailRow('Buceo', session.accumulatedDiveTime != null ? '${session.accumulatedDiveTime} min' : null),
            ]),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00B4DB), Color(0xFF0077BE)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Icon(Icons.scuba_diving, size: 48, color: Colors.white),
          const SizedBox(height: 12),
          Text(
            session.location,
            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            DateFormat('EEEE, d MMMM yyyy', 'es_ES').format(session.date),
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    // Filter out null children (rows with null values)
    final validChildren = children.where((c) => c is! SizedBox).toList();
    if (validChildren.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0077BE))),
        ),
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: validChildren),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    if (value == null || value.isEmpty || value == 'null') return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF64748B), fontSize: 14)),
          ),
          Expanded(
            flex: 3,
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF1E293B), fontSize: 14)),
          ),
        ],
      ),
    );
  }

  String? _formatTime(DateTime? dateTime) {
    if (dateTime == null) return null;
    return DateFormat('HH:mm').format(dateTime);
  }
}
