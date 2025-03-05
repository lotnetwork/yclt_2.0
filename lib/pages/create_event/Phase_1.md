Phase 1: Setup and Navigation
Objective: Establish the foundation for the Create Event feature and integrate it with the existing app structure.
Tasks:

Create the basic screen structure for the Create Event flow
Implement navigation from user profile to Create Event screen
Set up state management for the Create Event process
Create models for event data based on the provided JSON structure
Set up draft persistence mechanism

Deliverables:

Basic Create Event screen with navigation
Event data models
State management structure

## Create Event Feature File Structure

```
lib/
├── pages/
│   ├── create_event/
│   │   ├── models/
│   │   │   └── create_event_model.dart          # Event data model
│   │   ├── services/
│   │   │   └── event_api_service.dart           # API service for event operations
│   │   ├── routes/
│   │   │   └── app_routes.dart                  # Route definitions
│   │   └── create_event_page.dart               # Main create event screen
│   └── profile_componant/
│       └── profile_componant_widget.dart        # Updated to add Create Event button
```

### File Purposes:

1. **create_event_model.dart**: 
   - Defines the data structure for the event being created
   - Contains form validation logic
   - Provides conversion between form data and API data structure

2. **event_api_service.dart**:
   - Handles API calls for event operations
   - Includes methods for creating events, saving drafts, and retrieving categories
   - Implements geocoding functionality

3. **app_routes.dart**:
   - Defines routes for the Create Event feature
   - Provides navigation methods

4. **create_event_page.dart**:
   - Implements the main UI for event creation
   - Handles form input and validation
   - Manages publishing options and scheduling
   - Connects to payment flow

5. **profile_componant_widget.dart** (Update):
   - Adds entry point to Create Event feature from user profile
   - Includes button for "Create Yard Closet Event"

This structure follows a clean separation of concerns, with models, services, and UI components clearly separated. The navigation is encapsulated in the routes file, making it easy to modify or extend in the future.


//lib/pages/create_event/models/create_event_model.dart
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';

/// Model class for the Create Event screen
class CreateEventModel extends FlutterFlowModel {
  // State fields
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];
  
  // Event title controller
  TextEditingController? eventTitleController;
  String? Function(BuildContext, String?)? eventTitleControllerValidator;
  
  // Event description controller
  TextEditingController? eventDescriptionController;
  String? Function(BuildContext, String?)? eventDescriptionControllerValidator;
  
  // Event venue address controller
  TextEditingController? eventAddressController;
  String? Function(BuildContext, String?)? eventAddressControllerValidator;
  
  // Category dropdown controller
  String? categoryValue;
  FormFieldController<List<String>>? categoryValueController;
  
  // Duration dropdown controller
  String? durationValue;
  FormFieldController<String>? durationValueController;
  
  // Event rate (calculated based on duration)
  double eventRate = 0.0;
  
  // Date selection fields
  bool isConsecutiveDates = true; // Default to consecutive dates
  DateTime? startDate;
  DateTime? endDate;
  List<DateTime> selectedDates = [];
  
  // Time selection fields
  List<TimeOfDay> startTimes = [];
  List<TimeOfDay> endTimes = [];
  
  // Status trackers
  bool isDraft = false;
  bool isScheduled = false;
  DateTime? scheduledPublishDateTime;
  
  // Latitude and longitude (read-only, populated on publish)
  double? latitude;
  double? longitude;
  
  /// Initialize the model
  void initState(BuildContext context) {
    eventTitleController = TextEditingController();
    eventDescriptionController = TextEditingController();
    eventAddressController = TextEditingController();
    eventTitleControllerValidator = _eventTitleValidator;
    eventDescriptionControllerValidator = _eventDescriptionValidator;
    eventAddressControllerValidator = _eventAddressValidator;
  }

  /// Dispose of controllers when no longer needed
  void dispose() {
    eventTitleController?.dispose();
    eventDescriptionController?.dispose();
    eventAddressController?.dispose();
  }
  
  // Validation functions
  String? _eventTitleValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Event title is required';
    }
    return null;
  }
  
  String? _eventDescriptionValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Event description is required';
    }
    return null;
  }
  
  String? _eventAddressValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Event venue address is required';
    }
    return null;
  }
  
  // Calculate rate based on selected duration
  void calculateRate() {
    switch (durationValue) {
      case '1-day':
        eventRate = 11.00;
        break;
      case '2-days':
        eventRate = 19.00;
        break;
      case '3-days':
        eventRate = 28.00;
        break;
      default:
        eventRate = 0.00;
    }
  }
  
  // Function to add a date/time combination
  void addDateTimeCombo(DateTime date, TimeOfDay startTime, TimeOfDay endTime) {
    if (startTimes.length < 3) { // Maximum of 3 date/time combinations
      selectedDates.add(date);
      startTimes.add(startTime);
      endTimes.add(endTime);
    }
  }
  
  // Function to remove a date/time combination
  void removeDateTimeCombo(int index) {
    if (index >= 0 && index < selectedDates.length) {
      selectedDates.removeAt(index);
      startTimes.removeAt(index);
      endTimes.removeAt(index);
    }
  }
  
  // Convert model to event JSON for API
  Map<String, dynamic> toEventJson() {
    // Build dates array
    List<Map<String, String>> dates = [];
    for (int i = 0; i < selectedDates.length; i++) {
      dates.add({
        'date': DateFormat('yyyy-MM-dd').format(selectedDates[i]),
        'startTime': '${startTimes[i].hour}:${startTimes[i].minute.toString().padLeft(2, '0')}',
        'endTime': '${endTimes[i].hour}:${endTimes[i].minute.toString().padLeft(2, '0')}',
      });
    }
    
    return {
      'event': eventTitleController?.text ?? '',
      'description': eventDescriptionController?.text ?? '',
      'address': eventAddressController?.text ?? '',
      'categoryId': categoryValue != null ? [categoryValue] : [],
      'dates': dates,
      'galleryImg': uploadedFileUrls,
      'rate': eventRate,
      'duration': durationValue?.split('-')[0] ?? '',
      'dateSelectionType': isConsecutiveDates ? 'consecutive' : 'separate',
      'status': isScheduled ? 'Scheduled' : 'Published',
      'is_completed': isScheduled ? 'On Hold' : 'Upcoming',
    };
  }
}

// lib/pages/create_event/services/event_api_service.dart
import 'package:flutter/material.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Service class for Event API calls
class EventApiService {
  /// Prepare event creation API call
  static Future<ApiCallResponse> createEvent({
    required Map<String, dynamic> eventData,
    required String token,
  }) async {
    // This function would call the actual API endpoint for event creation
    // For now, we'll return a placeholder response
    
    // In the actual implementation, this would look something like this:
    /*
    return CreateEventApiCall.call(
      eventData: eventData,
      token: token,
    );
    */
    
    // Placeholder response
    return ApiCallResponse(
      statusCode: 200,
      jsonBody: {
        'data': {
          'success': 1,
          'message': 'Event created successfully',
          'eventId': 'sample-event-id-123',
        }
      },
      bodyText: '',
      headers: {},
    );
  }
  
  /// Save event as draft
  static Future<ApiCallResponse> saveDraft({
    required Map<String, dynamic> eventData,
    required String token,
  }) async {
    // This function would call the actual API endpoint for saving a draft
    // For now, we'll return a placeholder response
    
    // Placeholder response
    return ApiCallResponse(
      statusCode: 200,
      jsonBody: {
        'data': {
          'success': 1,
          'message': 'Draft saved successfully',
          'draftId': 'sample-draft-id-123',
        }
      },
      bodyText: '',
      headers: {},
    );
  }
  
  /// Get event categories
  static Future<ApiCallResponse> getCategories({
    required String token,
  }) async {
    // In the real implementation, this would call the actual API endpoint
    // For now, we'll use the existing allCategoryApiCall
    
    return EventAPIGroup.allCategoryApiCall.call(
      token: token,
    );
  }
  
  /// Get event durations
  static Future<ApiCallResponse> getDurations({
    required String token,
  }) async {
    // This function would call the actual API endpoint for getting durations
    // For now, we'll return a placeholder response
    
    // Placeholder response with hardcoded durations
    return ApiCallResponse(
      statusCode: 200,
      jsonBody: {
        'data': {
          'success': 1,
          'durations': [
            {'id': '1', 'name': '1-day', 'rate': 11.00},
            {'id': '2', 'name': '2-days', 'rate': 19.00},
            {'id': '3', 'name': '3-days', 'rate': 28.00},
          ]
        }
      },
      bodyText: '',
      headers: {},
    );
  }
  
  /// Convert address to coordinates using MapBox
  static Future<Map<String, double>?> geocodeAddress(String address) async {
    // This function would call the actual MapBox API for geocoding
    // For now, we'll return a placeholder response
    
    // Placeholder coordinates
    return {
      'latitude': 40.7128,
      'longitude': -74.0060,
    };
  }
}

// lib/pages/create_event/create_event_page.dart

import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/componants/common_appbar/common_appbar_widget.dart';
import '/pages/create_event/models/create_event_model.dart';
import '/pages/create_event/services/event_api_service.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  late CreateEventModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  // Categories for dropdown (will be populated from API)
  List<String> _categories = [];
  bool _isLoading = true;
  
  // Durations for dropdown
  final List<String> _durations = ['1-day', '2-days', '3-days'];

  @override
  void initState() {
    super.initState();
    _model = CreateEventModel();
    _model.initState(context);
    
    // Load categories
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    setState(() {
      _isLoading = true;
    });
    
    try {
      final response = await EventApiService.getCategories(
        token: FFAppState().token,
      );
      
      if (response.statusCode == 200) {
        final categoryList = EventAPIGroup.allCategoryApiCall.categoryList(
          response.jsonBody,
        ) as List<dynamic>?;
        
        if (categoryList != null) {
          setState(() {
            _categories = categoryList
                .map((item) => getJsonField(item, r'''$.category''').toString())
                .toList();
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      print('Error loading categories: $e');
    }
    
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Common AppBar
              wrapWithModel(
                model: CommonAppbarModel(),
                updateCallback: () => setState(() {}),
                child: const CommonAppbarWidget(
                  title: 'Create Event',
                ),
              ),
              // Main content
              Expanded(
                child: _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : _buildForm(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Upload Section
              _buildImageUploadSection(),
              const SizedBox(height: 20),
              
              // Event Title
              _buildSectionTitle('Event Title'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _model.eventTitleController!,
                validator: _model.eventTitleControllerValidator!,
                hintText: 'Enter event title',
              ),
              const SizedBox(height: 20),
              
              // Event Category
              _buildSectionTitle('Event Category'),
              const SizedBox(height: 8),
              _buildCategoryDropdown(),
              const SizedBox(height: 20),
              
              // Event Description
              _buildSectionTitle('Event Description'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _model.eventDescriptionController!,
                validator: _model.eventDescriptionControllerValidator!,
                hintText: 'Enter event description',
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              
              // Event Duration
              _buildSectionTitle('Event Duration'),
              const SizedBox(height: 8),
              _buildDurationDropdown(),
              const SizedBox(height: 10),
              
              // Rate (Read-Only)
              _buildRateDisplay(),
              const SizedBox(height: 20),
              
              // Schedule Section Placeholder
              _buildSectionTitle('Schedule'),
              const SizedBox(height: 8),
              _buildSchedulePlaceholder(),
              const SizedBox(height: 20),
              
              // Venue Address
              _buildSectionTitle('Venue Address'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _model.eventAddressController!,
                validator: _model.eventAddressControllerValidator!,
                hintText: 'Enter venue address',
              ),
              const SizedBox(height: 20),
              
              // Latitude and Longitude (Read-Only)
              _buildLocationCoordinates(),
              const SizedBox(height: 30),
              
              // Action Buttons
              _buildActionButtons(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SF Pro Display',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.0,
            useGoogleFonts: false,
            lineHeight: 1.5,
          ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String? Function(BuildContext, String?) validator,
    required String hintText,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'SF Pro Display',
              color: FlutterFlowTheme.of(context).ashGrayColor,
              fontSize: 16.0,
              letterSpacing: 0.0,
              useGoogleFonts: false,
              lineHeight: 1.5,
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).ashGrayColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(22.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primaryText,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(22.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(22.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(22.0),
        ),
        contentPadding: const EdgeInsets.all(18.0),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SF Pro Display',
            fontSize: 16.0,
            letterSpacing: 0.0,
            useGoogleFonts: false,
            lineHeight: 1.5,
          ),
    );
  }

  Widget _buildImageUploadSection() {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(22.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).ashGrayColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_photo_alternate_outlined,
              color: FlutterFlowTheme.of(context).primary,
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(
              'Upload Gallery Images (up to 6)',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'SF Pro Display',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return FlutterFlowDropDown<String>(
      controller: _model.categoryValueController ??= FormFieldController<List<String>>(null),
      options: _categories,
      width: double.infinity,
      height: 60,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SF Pro Display',
            fontSize: 16.0,
            letterSpacing: 0.0,
            useGoogleFonts: false,
          ),
      hintText: 'Select Event Category',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 24,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2,
      borderColor: FlutterFlowTheme.of(context).ashGrayColor,
      borderWidth: 1,
      borderRadius: 22,
      margin: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
      hidesUnderline: true,
      isSearchable: false,
      isMultiSelect: true,
      onChanged: (val) => setState(() {
        _model.categoryValue = val?.isNotEmpty == true ? val?.first : null;
      }),
    );
  }

  Widget _buildDurationDropdown() {
    return FlutterFlowDropDown<String>(
      controller: _model.durationValueController ??= FormFieldController<String>(null),
      options: _durations,
      onChanged: (val) => setState(() {
        _model.durationValue = val;
        _model.calculateRate(); // Calculate rate based on duration
      }),
      width: double.infinity,
      height: 60,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SF Pro Display',
            fontSize: 16.0,
            letterSpacing: 0.0,
            useGoogleFonts: false,
          ),
      hintText: 'Select Event Duration',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 24,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2,
      borderColor: FlutterFlowTheme.of(context).ashGrayColor,
      borderWidth: 1,
      borderRadius: 22,
      margin: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
      hidesUnderline: true,
      isSearchable: false,
    );
  }

  Widget _buildRateDisplay() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(22.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).ashGrayColor,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 18, 16, 18),
        child: Text(
          'Rate: \$${_model.eventRate.toStringAsFixed(2)}',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'SF Pro Display',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
        ),
      ),
    );
  }

  Widget _buildSchedulePlaceholder() {
    // This is a placeholder for the schedule section
    // In the next phase, we'll implement the actual date/time selection
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(22.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).ashGrayColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date/Time Selection',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Display',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
                Icon(
                  Icons.expand_more,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Select up to 3 date/time combinations',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'SF Pro Display',
                    color: FlutterFlowTheme.of(context).ashGrayColor,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationCoordinates() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Latitude',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                      lineHeight: 1.5,
                    ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    _model.latitude?.toString() ?? 'Auto-populated after publishing',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Display',
                          color: FlutterFlowTheme.of(context).ashGrayColor,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Longitude',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                      lineHeight: 1.5,
                    ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    _model.longitude?.toString() ?? 'Auto-populated after publishing',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Display',
                          color: FlutterFlowTheme.of(context).ashGrayColor,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Validate form fields
  bool _validateForm() {
    return _model.formKey.currentState!.validate();
  }
  
  // Save event as draft
  Future<void> _saveDraft() async {
    if (_model.eventTitleController!.text.isEmpty) {
      await actions.showCustomToastBottom(
        'Please enter an event title before saving as draft',
      );
      return;
    }
    
    setState(() {
      _model.isDraft = true;
    });
    
    try {
      final response = await EventApiService.saveDraft(
        eventData: _model.toEventJson(),
        token: FFAppState().token,
      );
      
      if (response.statusCode == 200) {
        await actions.showCustomToastBottom(
          'Event saved as draft successfully',
        );
        Navigator.pop(context);
      } else {
        await actions.showCustomToastBottom(
          'Failed to save draft: ${response.jsonBody}',
        );
      }
    } catch (e) {
      await actions.showCustomToastBottom(
        'Error saving draft: $e',
      );
    }
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Save as Draft Button
        Expanded(
          child: FFButtonWidget(
            onPressed: () async {
              // Save as draft functionality
              await _saveDraft();
            },
            text: 'Save as Draft',
            options: FFButtonOptions(
              height: 60,
              padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              color: FlutterFlowTheme.of(context).primaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'SF Pro Display',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: false,
                  ),
              elevation: 0,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 1,
              ),
              bo
              rderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Publish Button
        Expanded(
          child: FFButtonWidget(
            onPressed: () async {
                              // Publish functionality (will navigate to publishing options)
              if (_validateForm()) {
                // Navigate to publishing options
                // This will be implemented in the next phase
                await _showPublishingOptions();
              }

// lib/pages/create_event/routes/app_routes.dart

import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/create_event/create_event_page.dart';
import '/pages/create_event/models/create_event_model.dart';

/// Class to manage navigation routes for Create Event feature
class CreateEventRoutes {
  /// Add the Create Event route to the app's routes
  static List<GoRoute> getRoutes() {
    return [
      FFRoute(
        name: 'CreateEventPage',
        path: '/createEventPage',
        builder: (context, params) => const CreateEventPage(),
      ),
      // Additional routes for event management would be added here
    ];
  }
  
  /// Navigate to Create Event page
  static void goToCreateEvent(BuildContext context) {
    context.pushNamed('CreateEventPage');
  }
}

// lib/pages/profile_componant/profile_componant_widget.dart (Update)
// This is not the complete file, but just the update needed to add the Create Event button
// to the existing profile_componant_widget.dart file

// Add this import at the top of the file
import '/pages/create_event/routes/app_routes.dart';

// Add this button after the existing profile section in the ListView
// (Find the appropriate location in the existing file where user profile features are displayed)

Padding(
  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
  child: InkWell(
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () async {
      if (FFAppState().isLogin == true) {
        CreateEventRoutes.goToCreateEvent(context);
      } else {
        context.pushNamed('SignInPage');
      }
    },
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 27.0,
            color: Color(0x2690B6B8),
            offset: Offset(
              0.0,
              8.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(3.0, 3.0, 18.0, 3.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 54.0,
              height: 54.0,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F5),
                borderRadius: BorderRadius.circular(22.0),
                shape: BoxShape.rectangle,
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Icon(
                Icons.event_available,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
            ),
            Expanded(
              child: Text(
                'Create Yard Closet Event',
                maxLines: 1,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Display',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                      lineHeight: 1.5,
                    ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: SvgPicture.asset(
                'assets/images/arrow_right.svg',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.contain,
              ),
            ),
          ].divide(const SizedBox(width: 16.0)),
        ),
      ),
    ),
  ),
),

// lib/pages/componants/common_appbar/common_appbar_model.dart

import '/flutter_flow/flutter_flow_model.dart';

class CommonAppbarModel extends FlutterFlowModel {
  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.
}

// 
