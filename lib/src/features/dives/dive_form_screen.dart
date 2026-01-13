import 'package:divelog2/src/features/dives/dive_form_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DiveFormScreen extends StatefulWidget {
  const DiveFormScreen({super.key});

  @override
  State<DiveFormScreen> createState() => _DiveFormScreenState();
}

class _DiveFormScreenState extends State<DiveFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final _locationController = TextEditingController();
  final _clientController = TextEditingController();
  final _operatorController = TextEditingController();
  final _operatorAddressController = TextEditingController();
  final _diversNamesController = TextEditingController();
  final _maxDepthController = TextEditingController();
  final _bottomTimeController = TextEditingController();
  final _surfaceIntervalController = TextEditingController();
  final _totalDiveTimeController = TextEditingController();
  final _gasMixtureController = TextEditingController();
  final _workDescriptionController = TextEditingController();
  final _decompressionUsedController = TextEditingController();
  final _illnessOrInjuryController = TextEditingController();
  final _diveSupervisorController = TextEditingController();
  final _accSupervisionController = TextEditingController();
  final _accDiveTimeController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay? _entryTime;
  TimeOfDay? _exitTime;
  TimeOfDay? _decoStart;
  TimeOfDay? _decoComplete;
  String? _selectedDiveType;

  final List<String> _diveTypes = [
    'Scuba',
    'Asist. Superficie',
    'Altura Geográfica',
    'Saturación',
  ];

  @override
  void dispose() {
    _locationController.dispose();
    _clientController.dispose();
    _operatorController.dispose();
    _operatorAddressController.dispose();
    _diversNamesController.dispose();
    _maxDepthController.dispose();
    _bottomTimeController.dispose();
    _surfaceIntervalController.dispose();
    _totalDiveTimeController.dispose();
    _gasMixtureController.dispose();
    _workDescriptionController.dispose();
    _decompressionUsedController.dispose();
    _illnessOrInjuryController.dispose();
    _diveSupervisorController.dispose();
    _accSupervisionController.dispose();
    _accDiveTimeController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('es', 'ES'),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<TimeOfDay?> _pickTime(String label) async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: label,
    );
  }

  DateTime? _combine(DateTime date, TimeOfDay? time) {
    if (time == null) return null;
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context.read<DiveFormViewModel>().saveDiveSession(
          date: _selectedDate,
          location: _locationController.text,
          client: _clientController.text,
          diveOperator: _operatorController.text,
          operatorAddress: _operatorAddressController.text,
          diveType: _selectedDiveType,
          diversNames: _diversNamesController.text,
          entryTime: _combine(_selectedDate, _entryTime),
          exitTime: _combine(_selectedDate, _exitTime),
          maxDepth: double.parse(_maxDepthController.text),
          surfaceInterval: int.tryParse(_surfaceIntervalController.text),
          bottomTime: int.parse(_bottomTimeController.text),
          decompressionStart: _combine(_selectedDate, _decoStart),
          decompressionComplete: _combine(_selectedDate, _decoComplete),
          totalDiveTime: int.tryParse(_totalDiveTimeController.text),
          gasMixture: _gasMixtureController.text,
          workDescription: _workDescriptionController.text,
          decompressionUsed: _decompressionUsedController.text,
          illnessOrInjury: _illnessOrInjuryController.text,
          diveSupervisor: _diveSupervisorController.text,
          accumulatedSupervisionTime: int.tryParse(
            _accSupervisionController.text,
          ),
          accumulatedDiveTime: int.tryParse(_accDiveTimeController.text),
        );
        if (mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Inmersión guardada correctamente')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error al guardar: $e')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva Inmersión')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionHeader('Información General'),
              _buildCard([
                ListTile(
                  title: Text(
                    'Fecha: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: _pickDate,
                ),
                _buildTextField(
                  _locationController,
                  'Lugar de Buceo',
                  required: true,
                ),
                _buildTextField(_clientController, 'Cliente'),
                _buildTextField(_operatorController, 'Operadora de Buceo'),
                _buildTextField(
                  _operatorAddressController,
                  'Dirección de la Operadora',
                ),
                DropdownButtonFormField<String>(
                  initialValue: _selectedDiveType,
                  decoration: const InputDecoration(labelText: 'Tipo de Buceo'),
                  items: _diveTypes
                      .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                      .toList(),
                  onChanged: (val) => setState(() => _selectedDiveType = val),
                ),
                _buildTextField(
                  _diversNamesController,
                  'Nombre de Buzos',
                  maxLines: 2,
                ),
              ]),
              const SizedBox(height: 16),
              _buildSectionHeader('Detalles de la Sesión'),
              _buildCard([
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Entrada: ${_entryTime?.format(context) ?? "--:--"}',
                        ),
                        onTap: () async {
                          final t = await _pickTime('Hora de entrada');
                          if (t != null) setState(() => _entryTime = t);
                        },
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Salida: ${_exitTime?.format(context) ?? "--:--"}',
                        ),
                        onTap: () async {
                          final t = await _pickTime('Hora de Salida');
                          if (t != null) setState(() => _exitTime = t);
                        },
                      ),
                    ),
                  ],
                ),
                _buildTextField(
                  _maxDepthController,
                  'Profundidad Máxima (m)',
                  keyboardType: TextInputType.number,
                  required: true,
                ),
                _buildTextField(
                  _bottomTimeController,
                  'Tiempo de Fondo (min)',
                  keyboardType: TextInputType.number,
                  required: true,
                ),
                _buildTextField(
                  _surfaceIntervalController,
                  'Intervalo en Superficie (min)',
                  keyboardType: TextInputType.number,
                ),
                _buildTextField(
                  _totalDiveTimeController,
                  'Tiempo Total Inmersión (min)',
                  keyboardType: TextInputType.number,
                ),
              ]),
              const SizedBox(height: 16),
              _buildSectionHeader('Descompresión'),
              _buildCard([
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Inicio: ${_decoStart?.format(context) ?? "--:--"}',
                        ),
                        onTap: () async {
                          final t = await _pickTime('Inicio Descompresión');
                          if (t != null) setState(() => _decoStart = t);
                        },
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          'Fin: ${_decoComplete?.format(context) ?? "--:--"}',
                        ),
                        onTap: () async {
                          final t = await _pickTime('Descompresión Completa');
                          if (t != null) setState(() => _decoComplete = t);
                        },
                      ),
                    ),
                  ],
                ),
                _buildTextField(
                  _decompressionUsedController,
                  'Descompresión Utilizada',
                ),
              ]),
              const SizedBox(height: 16),
              _buildSectionHeader('Técnico y Trabajo'),
              _buildCard([
                _buildTextField(_gasMixtureController, 'Mezcla Utilizada'),
                _buildTextField(
                  _workDescriptionController,
                  'Descripción de Trabajo',
                  maxLines: 3,
                ),
                _buildTextField(
                  _illnessOrInjuryController,
                  'Enfermedad o Lesión',
                ),
                _buildTextField(
                  _diveSupervisorController,
                  'Supervisor de Buceo',
                ),
              ]),
              const SizedBox(height: 16),
              _buildSectionHeader('Tiempos Acumulados (min)'),
              _buildCard([
                _buildTextField(
                  _accSupervisionController,
                  'Supervisión Acumulada',
                  keyboardType: TextInputType.number,
                ),
                _buildTextField(
                  _accDiveTimeController,
                  'Buceo Acumulado',
                  keyboardType: TextInputType.number,
                ),
              ]),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'GUARDAR INMERSIÓN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    bool required = false,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: (value) {
        if (required && (value == null || value.isEmpty)) {
          return 'Este campo es obligatorio';
        }
        return null;
      },
    );
  }
}
