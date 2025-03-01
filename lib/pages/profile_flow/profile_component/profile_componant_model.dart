import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componants/center_appbar/center_appbar_widget.dart';
import 'profile_componant_widget.dart' show ProfileComponantWidget;
import 'package:flutter/material.dart';

class ProfileComponantModel extends FlutterFlowModel<ProfileComponantWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CenterAppbar component.
  late CenterAppbarModel centerAppbarModel;

  @override
  void initState(BuildContext context) {
    centerAppbarModel = createModel(context, () => CenterAppbarModel());
  }

  @override
  void dispose() {
    centerAppbarModel.dispose();
  }
}
