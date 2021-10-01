import 'package:blood_pressure/model/measurement.dart';

class MeasurementRepository {
  final measurementDao = MeasurementDao();

  Future getAllMeasurements({String query}) => measurementDao.getTodos(query: query);

  Future insertTodo(Measurement todo) => measurementDao.createTodo(todo);
}