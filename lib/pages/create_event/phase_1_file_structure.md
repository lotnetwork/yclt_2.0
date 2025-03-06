lib/
├── pages/
│   ├── create_event/
│   │   ├── models/
│   │   │   ├── create_event_model.dart         # Event data model
│   │   │   └── schedule_model.dart             # Schedule data model
│   │   ├── widgets/
│   │   │   ├── image_upload_widget.dart        # Image upload section
│   │   │   ├── schedule_widget.dart            # Expandable schedule section
│   │   │   └── publishing_options_widget.dart  # Publishing options dialog
│   │   ├── screens/
│   │   │   ├── create_event_page.dart          # Main create event screen
│   │   │   ├── event_preview_page.dart         # Preview event before publishing
│   │   │   └── drafts_management_page.dart     # Manage event drafts
│   │   ├── services/
│   │   │   ├── event_api_service.dart          # API service for event operations
│   │   │   └── mapbox_service.dart             # MapBox geocoding service
│   │   └── utils/
│   │       ├── event_validators.dart           # Validation functions
│   │       └── html_sanitizer.dart             # HTML sanitization for description
