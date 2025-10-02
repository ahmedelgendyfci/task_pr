import 'package:equatable/equatable.dart';

/// Vital metric entity representing a health measurement
class VitalMetric extends Equatable {
  final String id;
  final String name;
  final double value;
  final String unit;
  final String? status; // normal, high, low, etc.
  final DateTime timestamp;
  final String? iconName;

  const VitalMetric({
    required this.id,
    required this.name,
    required this.value,
    required this.unit,
    this.status,
    required this.timestamp,
    this.iconName,
  });

  @override
  List<Object?> get props => [id, name, value, unit, status, timestamp, iconName];

  @override
  String toString() => 'VitalMetric(id: $id, name: $name, value: $value, unit: $unit, status: $status, timestamp: $timestamp)';
}
