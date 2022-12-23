
import '../../bloc/office_create_2/office_create_2_bloc.dart';
import '../../domain/entities/workplace.dart';

class WorkplaceModel extends Workplace{
  const WorkplaceModel({
    required super.isFree,
    required super.id,
    required super.capacity,
    required super.floorId,
    required super.typeName,
    required super.typeId,
  });

  factory WorkplaceModel.fromJson(Map<String, dynamic> json){
    return WorkplaceModel(
        id: json['id'] as int,
        capacity: json['capacity'] as int,
        floorId: json['floorId'] as int,
        typeName: json['typeName'] as String,
        isFree: json['isFree'] == null ? null : json['isFree']  as bool,
        typeId: null
    );
  }

  factory WorkplaceModel.fromMini(MiniWorkplace miniWorkplace, int floorId){
    return WorkplaceModel(
        isFree: null,
        id: null,
        capacity: miniWorkplace.capacity,
        floorId: floorId,
        typeName: null,
        typeId: miniWorkplace.typeId
    );
  }

  Map<String, dynamic> toJson(){
    return <String, dynamic>{
      'id':id,
      'capacity':capacity,
      'floorId':floorId,
      'typeName':typeName,
      'isFree':isFree,
      'typeId': typeId,
    };
  }
}
