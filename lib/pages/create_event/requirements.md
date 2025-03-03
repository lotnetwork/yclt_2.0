You will be implementing the new create event screen.  Write all new code including the locations where to be  placed within the application.  This new screen will be using some code and screens that are already part of the existing attached app.  If your requirement is to add additional code to any of the existing files then make the necessary (and only if necessary) changes that warrant the support of the new code.  Any existing code you modify, is to maintain the original look and feel from the initial app.  Please Review and analyze thoroughly whatever changes or additions you implement.  Thoroughly check you codes, for consistency, correctness and proper syntax.  Please check your code to not include any depreciation.   You are to maintin the existing code as it is, Before you proceed ask any questions you may have before writing any code or designing any screen.
Here are your requirements:

## Comprehensive Development Requirements for the Create Event Process

Objective
To implement a seamless, user-friendly, and efficient "Create Event" process, integrated with the Yard Closet app. This process will:
Start from the user profile screen via the "Create Yard Closet Event" button.
Guide users through creating, validating, and publishing events.
Include a payment process utilizing the existing payment method screen already implemented in the app.
Allow users to edit or delete their events after creation, with appropriate restrictions and refund handling.
Ensure real-time synchronization, security, and high performance.

1. Entry Point
Location
In the file: profile_componant_widget.dart (User Profile), there is a button labeled "Create Yard Closet Event". This is where the Create Event process starts. 
Action
When this button is tapped, the app navigates to the Create Event Screen.

2. Create Event Screen Functionality
Required Fields
The following fields must appear on the screen in the following order:
Gallery Images: Upload functionality for event cover and gallery images.
Event Title: Text input field for the event title.
Event Category: Multi-select dropdown populated with categories fetched from the database.
Event Description:  Short summary of the event.
Event Duration: Dropdown (fetched from the database collection: duration) with the following options:
1-day ($11.00)
2-days ($19.00)
3-days ($28.00)
Rate: The amount Auto-populated based on the selected event duration. (read-only)
Schedule:
Expandable sections for selecting up to 3 date/time combinations.
Each section includes:
Start Date
End Date
Start Time
End Time
Venue Address: Text input for the event location.
Latitude:
Read-only field populated on publishing using a geocoding service.  Latitude is populated from the geo service after the event has been published.
Longitude:
Read-only field populated on publishing using a geocoding service.  Longitude is populated from the geo service after the event has been published.
Publish Button: Finalizes event creation.

3. UI/UX Enhancements
Inline validation for all fields.
Expandable sections for schedule inputs to avoid clutter.
Descriptive labels and placeholders for user guidance.
Visual hierarchy with grouped fields and spacing.

4. Validation
Before Publishing
Mandatory Fields: Ensure all required fields are completed.
Data Formatting:
Dates must be in valid formats.
Start times must precede end times.
No overlapping schedules.
Terms of Service: Ensure the user agrees to the disclaimer before enabling the "Publish" button.

5. Publish and Payment Process
Step 1: Validation
On tapping the "Publish" button:
Validate all inputs.
If validation fails, display error messages inline.
Step 2: Navigation to Payment Screen
Navigate to the existing Payment Method screen.
Pass the following details:
Event Name.
Event Rate: is assigned the rate value from event_rate collection based on the duration selected,  no other calculations are applied.
Payment Screen Integration:
The payment screen should reuse the existing payment method.

User-selected details for review.
Step 3: Payment Options
Utilize the existing payment process to:
Allow users to select a payment method and complete the transaction.
Ensure proper integration with existing payment gateways (Stripe, RazorPay, PayPal).
Step 4: Post-Payment Actions
On Successful Payment:
Save event data to MongoDB via api_calls.dart (you have already provided the code for).
Update the event status to "Published."
Notify the user of successful event publication.
Redirect the user to the main app screen with a success message.
On Payment Failure:
Display an error message.
Allow the user to retry or return to the Create Event screen.

6. Edit and Delete Functionality
The edit/delete functionalities should follow a similar flow/UI as the create event process
Edit Event
Users can edit their events after creation, provided:
The event has not yet started.
All mandatory fields remain valid after edits.
Upon saving edits:
Validate updated inputs.
Update the event data in MongoDB.
Notify users of the successful update.
Delete Event
Users can delete their events after creation.

7. Refund Handling:
Charge a $5.00 refund fee for event deletion.
Reference the Terms of Service during this transaction regarding refund.
Upon deletion:
Update the event status to "Deleted."
Notify the user of the successful deletion and refund.

8. Backend Requirements
Fail-Safe Mechanism
If MongoDB write fails, temporarily store the data in Firebase.
Use a background service to sync data from Firebase to MongoDB.
Real-Time Synchronization
Use WebSocket or Firebase Realtime Database to ensure newly created, edited, or deleted events are immediately visible to other users.
Notifications
Notify users of successful event creation, updates, or deletions via:
Push notifications (Firebase Cloud Messaging).
In-app dialog or toast message.

9. Security Considerations
Input Sanitization:
Remove malicious scripts or characters.
Enforce field-specific validation (e.g., numeric checks for price).
Rate Limiting:
Limit event creation, edits, and deletions to prevent spam.
Account Restrictions:
Disable accounts submitting spammy or malicious data.
Secure Payment Processing:
Use HTTPS for communication with payment gateways.
Validate payment status server-side before marking events as published, edited, or deleted.

10. Post-Publishing Actions
Event Visibility
Ensure newly created, edited, or deleted events are immediately visible in the app.
Navigation
Redirect users to:
The main app screen or event details page on successful event creation, edit, or deletion.
The Create Event screen on payment failure with pre-filled data.

11. Development Best Practices
Code Modularity:
Separate logic for frontend UI, backend API, and database interactions.
Performance Optimization:
Cache frequently used data (e.g., categories) to reduce API calls.
Optimize image uploads for faster processing.
User Experience:
Provide clear instructions and error messages.
Ensure all interactions are intuitive and responsive.

12. Deliverables
Fully functional Create Event screen integrated into the user profile.
Payment process implementation utilizing the existing Payment Method screen.
Edit and delete functionality for user-created events.
Backend API for event creation, updates, deletions, and synchronization.
Real-time updates and notifications for users.
Documentation for developers and QA teams.Ron 

This document ensures the Create Event process is user-friendly, secure, and aligned with industry best practices. Let me know if additional details are needed!
Additional Questions/Answers:
### Image/Media Handling:

What are the exact specifications for image uploads (file size limits, allowed formats)?
Is there a maximum number of gallery images that can be uploaded?
How should images be validated before uploading?

For image and media handling in event management applications, the following industry standards are typically followed:

### Image Upload Specifications (Industry Standards)
1. **File Size Limits**:
   - Maximum file size of 5-10 MB per image
   - Optimal size of 1-5 MB for balance between quality and performance

2. **Allowed Formats**:
   - Common formats: JPEG, PNG, GIF, WebP
   - JPEG and PNG are most commonly supported
   - WebP is becoming more standard for web applications due to better compression

### Image Validation Best Practices
1. **Client-side Validation**:
   - Validate file type by checking MIME type, not just file extension
   - Check image dimensions to ensure minimum quality (e.g., at least 800x600 pixels)
   - Implement file size validation before upload begins

2. **Server-side Validation**:
   - Re-validate file type and size on the server
   - Scan for malicious content
   - Strip EXIF data for privacy (unless location data is needed)
   - Generate appropriate thumbnails for different display contexts

3. **Image Processing**:
   - Compress images to optimize storage and loading time
   - Resize images to standard dimensions that work well with your UI
   - Create multiple resolutions for responsive design

4. **User Experience**:
   - Provide clear feedback on acceptable formats and sizes
   - Show upload progress for larger files
   - Allow preview and cropping before final submission

For your specified maximum of 6 gallery images, you should implement a UI that clearly indicates this limit and prevents additional uploads once reached. You might also want to consider implementing a feature that allows users to reorder the images, with the first image automatically set as the featured/cover image for the event.


## Date and Time Handling:

The requirements mention multi-day events with different time slots - is there a maximum number of date/time combinations allowed?
What timezone handling is required for events? Do we need to store/display timezone information?
### Date and Time Handling
## Event Creation: Date and Time Selection Requirements

**Objective:** To provide users with a flexible and intuitive method for selecting event dates and times, accommodating both consecutive and separate date selections with varying start and end times for each date.

**Requirements:**

**1. Date Selection Modes:**

* **Consecutive Dates (Default):**
    * Users shall be able to select a range of consecutive dates using a standard date range picker.
    * The date range picker shall be the default selection method.
    * The user shall be able to switch to separate date selection mode.
* **Separate Dates:**
    * Users shall be able to select individual, non-consecutive dates from a calendar view.
    * The selected dates shall be visually highlighted on the calendar.
    * A list of selected dates shall be displayed below the calendar.
    * The user shall be able to switch back to consecutive date selection mode.

**2. Time Selection:**

* **Start and End Times:**
    * Users shall be able to specify a start and end time for each selected date.
    * Time selection shall be performed using appropriate time picker components.
    * Time input fields shall be clearly labeled (e.g., "Start Time," "End Time").
* **Consecutive Dates Time Input:**
    * After a consecutive date range is selected, the application shall display start and end time input fields for each date within the range.
    * The first day and last day time selections should be the first displayed.
* **Separate Dates Time Input:**
    * When a user selects a date from the calendar in separate date selection mode, the application shall immediately display start and end time input fields below the calendar.
    * The selected dates list shall display the date along with the corresponding start and end times.
* **Time Format:**
    * The application shall respect the user's preferred time format (12-hour or 24-hour).

**3. User Interface (UI) Requirements:**

* **Clear Visual Feedback:**
    * Selected dates shall be visually highlighted on the calendar.
    * The list of selected dates shall be clearly displayed.
    * The total cost shall be dynamically updated as dates and times are selected.
* **Intuitive Layout:**
    * The date and time selection interface shall be intuitive and easy to use.
    * Time input fields shall be placed logically in relation to the corresponding dates.
    * Visual cues (e.g., borders, spacing) shall be used to group related elements.
* **Mobile Responsiveness:**
    * The date and time selection interface shall be responsive and usable on mobile devices.
* **Error Handling:**
    * The application shall provide clear error messages if the user enters invalid time values (e.g., end time before start time).
    * The application should validate that at least one date is selected.
* **Remove Selected Date-Time Entry:**
    * In "Separate Dates" selection mode, each selected date-time entry in the list of dates shall have a clearly visible "remove" control (e.g., an "[X]" button or a "delete" icon) beside it.
    * When the remove control is activated, the corresponding date-time entry shall be immediately removed from the list, and the total cost shall be recalculated.

**Why this is important:**

* **User Control:** It empowers users to easily correct mistakes or change their selections.
* **Efficiency:** It avoids the need to clear all selections and start over.
* **User Experience:** It contributes to a more polished and user-friendly interface.

By explicitly including the "remove" control requirement, we ensure that this essential functionality is implemented.


**4. Data Storage:**

* **Data Structure:**
    * The event data shall be stored in a structured format (e.g., JSON) that accommodates both consecutive and separate date selections with varying start and end times.
    * The date information should be stored in an array of objects. Each object in the array should contain the date, start time and end time.
    * A field should be included to indicate the date selection type (consecutive or seperate).
    * The total cost of the event should be stored.

**5. Functionality:**

* The total cost of the event should be calculated and displayed to the user.
* The number of days selected should be calculated and stored.

These requirements ensure a comprehensive and user-friendly event creation process that handles diverse date and time scheduling needs.


**Payment Processing:

The payment process already in the app will be used for payment processing.  Refer to: payment_page_widget.dart for the payment flow process.
What is the payment flow for event creation? The cost for the event is based on the duration selected by the user.
How are refunds handled if an event is canceled or modified?
If the event is to start within 24 hours and the user chooses to cancel, the charge is $4, and the user is refunded the difference. 


User Permissions:

What validation is needed to ensure only authorized users can create events?  The create event process is part of the users profile.  The user would have to 
create an account in order to create an event.
Are there any role-based permissions for event creation?  Only that they are a registered user.


Field Validation:

Are there specific formatting requirements for fields like address, description, etc.?  Address is to be:  Street Address, City, State, Zip.
Address autocomplete is to be used.  MapBox is the geo service for this.
What HTML tags are permitted in the description field?
Commonly Permitted HTML Tags (and Why):

p (Paragraph):
For basic text formatting.
br (Line Break):
To create line breaks within text.   
strong (Bold):
To emphasize text.   
em (Italics):
To italicize text.
ul and li (Unordered List):
To create bulleted lists.   
  
ol and li (Ordered List):
To create numbered lists.   
  
a (Link):
To create hyperlinks (with appropriate security measures like rel="noopener noreferrer").
h1, h2, h3, etc. (Headings):
To create headings of various sizes.
  
span:
to allow inline styling.
Tags Typically Restricted (and Why):

script:
To prevent XSS attacks.
iframe:
To prevent embedding external content that could be malicious.
style:
To prevent users from overriding the application's CSS.
img:
May be allowed, but needs careful handling of src attributes to prevent security issues.
Any tag that could change the layout in unpredictable ways.


\*\*Location Services:

\*\*Mapping Integration:

\*\*\*Mapbox Geocoding:

Address Resolution: Mapbox's Geocoding API is used to convert user-entered addresses into geographic coordinates (latitude and longitude).

Address Suggestions: As the user types, Mapbox provides real-time address suggestions, improving accuracy and speed.

Reverse Geocoding: if a user moves a marker on the google map, Mapbox's reverse geocoding is used to change the lat/long back into an address.

\*\*\*Google Maps Display:

Map Visualization: Google Maps is used to display the event location on an interactive map within the event creation and viewing interfaces.

Marker Placement: Once an address is resolved by Mapbox, a marker is placed on the Google Map at the corresponding coordinates.

Map Interaction: Users can pan, zoom, and interact with the Google Map to visually confirm the event location.

Marker Movement: users can move the marker to a new location.

Map Display in Event Listings: When users browse event listings, Google Maps is used to display event locations on a map, allowing users to visualize event proximity.

\*\*\*Integration Workflow:

Address Input: The user enters an address in the address field.

Mapbox Geocoding: Mapbox's Geocoding API resolves the address to latitude and longitude.

Google Maps Display: The latitude and longitude coordinates are used to place a marker on the Google Map.

User Confirmation/Adjustment: The user visually confirms the location and can adjust the marker if needed.

Reverse Geocoding (if needed): if the user moves the marker, Mapbox's reverse geocoding is used to update the address field.

Data Storage: The latitude and longitude coordinates are stored in the event database.

Event Display: When the event is displayed, the stored coordinates are used to place a marker on the Google Map.

\*\*\*Key Considerations:

API Keys: Securely manage and store Mapbox and Google Maps API keys.

Error Handling: Implement robust error handling for API requests and map display.

Performance: Optimize map loading and rendering for a smooth user experience.

Mobile Optimization: Ensure that the map interface is responsive and usable on mobile devices.

User Experience: Make sure that the map and address input work together in a way that is easy for the user to understand.


Backend Integration:

What specific API endpoints will be needed for event creation and management?

Key API endpoints found:

eventDetailsApiCall - Gets details for a specific event

searchEventApiCall - Searches for events

bookTicketApiCall - Books tickets for events

getFavoriteEventAllApiCall - Gets user's favorite events

allCategoryApiCall - Gets all event categories

organizerApiCall - Gets event organizers

sponserApiCall - Gets event sponsors

UpdateEventApiCall - To edit existing events

DeleteEventApiCall - To delete events

What is the expected data structure for the request/response?

Data Structure:

{

"avatar": "concert\_avatar.jpg",

"event": "Summer Music Festival",

"categoryId": \["music", "festival"\],

"organizerId": \["music-org-1"\],

"sponsorId": \["sponsor-a"\],

"dates": \[

{

"date": "2024-07-12",

"startTime": "18:00",

"endTime": "23:00"

},

{

"date": "2024-07-13",

"startTime": "16:00",

"endTime": "22:00"

},

{

"date": "2024-07-14",

"startTime": "14:00",

"endTime": "20:00"

}

\],

"tax": 7,

"galleryImg": \["image1.jpg", "image2.png"\],

"photo\_link": "https://example.com/festival",

"address": "Central Park, New York",

"location": { "lat": 40.7128, "lng": -74.0060 },

"tagId": \["live", "outdoor"\],

"lastdate": "2024-07-14",

"totalSeat": 1000,

"totalBookedTicket": 850,

"availableticket": 150,

"briefdescription": "A weekend of live music!",

"disclaimer": "

No outside food or drinks.

",

"description": "

Enjoy performances from top artists.

",

"status": "Publish",

"is\_completed": "Upcoming",

"createdAt": "2024-06-10T10:00:00Z",

"updatedAt": "2024-07-10T12:00:00Z",

"\_\_v": 0,

"rate": 150,

"duration": "3",

"dateSelectionType": "consecutive"

}


Error Handling:

### Error Presentation to Users

1.  **Toast Messages for Non-Critical Errors**:
    
    *   Brief, non-intrusive notifications for minor errors
        
    *   Example: "Failed to load categories. Please try again."
        
    *   Implementation is already available via the actions.showCustomToastBottom() method
        
2.  **Alert Dialogs for Critical Errors**:
    
    *   Modal dialogs for errors requiring user acknowledgment
        
    *   Should include error details and suggested actions
        
    *   Example: When event creation fails due to validation errors
        
3.  **Inline Form Validation**:
    
    *   Display errors directly beneath affected form fields
        
    *   Real-time feedback as users input data
        
4.  **Error States in UI Components**:
    
    *   Visual indicators (red borders, warning icons)
        
    *   Loading states that transition to error states
        

### Recovery Flows for Failed Event Creation

1.  **Data Preservation**:
    
    *   Store form data in state when submission fails
        
    *   Allow users to retry without re-entering information
        
    *   Consider implementing auto-save to local storage for long forms
        
2.  **Partial Submission**:
    
    *   Handle scenarios where image uploads succeed but data submission fails
        
    *   Track uploaded assets and avoid re-uploading on retry
        
3.  **Guided Error Resolution**:
    
    *   Highlight specific fields causing validation errors
        
    *   Provide clear guidance on how to fix each issue
        
    *   Auto-scroll to problematic fields
        
4.  **Offline Support**:
    
    *   Detect connectivity issues and inform users
        
    *   Queue operations for when connectivity is restored
        
    *   Show appropriate offline indicators


Drafts and Publishing:

## Event Drafts and Scheduled Publishing - Developer Requirements

**Objective:** Implement a system for event drafts and scheduled publishing, enabling event organizers to manage event creation and publishing effectively.

**Functional Requirements:**

1.  **Draft Mode:**
    * Implement a "Draft" status for events.
    * Provide a "Save as Draft" button during event creation and editing.
    * Saving as a draft shall store the event data without making it publicly accessible.
    * Create a dedicated section or page for managing drafts.
    * Display a list of drafts, including event name, creation date, and last edited date.
    * Provide options to edit, preview, and delete drafts from the drafts list.

2.  **Scheduled Publishing:**
    * Allow event organizers to schedule events for future publishing.
    * Provide a "Publish" button during event editing.
    * When the "Publish" button is clicked, provide the following options:
        * "Publish Now"
        * "Schedule Publish"
    * If "Schedule Publish" is selected:
        * Display a date and time picker for scheduling the publishing date and time.
        * Store the scheduled publishing date and time in the event data.
        * Implement a background process or scheduled task to automatically publish events at the scheduled time.
        * Display a confirmation message with the scheduled publishing date and time.
        * Provide options to edit or cancel the scheduled publishing.

3.  **Event Status:**
    * Implement and manage the following event statuses:
        * "Draft"
        * "Scheduled"
        * "Published"
    * Display the current event status prominently on the event editing and viewing pages.

4.  **Event Editing:**
    * Allow editing of events in "Draft," "Scheduled," and "Published" statuses.
    * When editing a "Published" event, display a clear warning that changes will be visible to users.
    * Consider implementing a version history or audit trail to track changes to published events.

5.  **Preview Functionality:**
    * Provide a "Preview" option for drafts and scheduled events.
    * The preview shall display the event as it will appear when published.

6.  **Notifications:**
    * Display a confirmation message when an event is published or scheduled.
    * Implement email or in-app notifications to confirm publishing or scheduled publishing.
    * Send notifications when scheduled publishing occurs.

**User Interface (UI) Requirements:**

1.  **Clear Status Indicators:**
    * Use visual cues (e.g., labels, icons, color coding) to indicate event status.

2.  **Intuitive Publishing Options:**
    * Provide clear and easy-to-use publishing options.

3.  **Scheduled Publishing Interface:**
    * Design a user-friendly interface for scheduling publishing dates and times.

4.  **Drafts Management Interface:**
    * Create a clean and organized interface for managing drafts.

5.  **Confirmation Messages:**
    * Display clear and informative confirmation messages.

**Technical Requirements:**

1.  **Data Storage:**
    * Store the event status and scheduled publishing date/time in the event database.

2.  **Background Processing/Scheduled Tasks:**
    * Implement a reliable background process or scheduled task for automated scheduled publishing.

3.  **Notification System:**
    * Integrate with an email or in-app notification system.

4.  **Security:**
    * Ensure that drafts and scheduled events are not publicly accessible until published.

5.  **Error Handling:**
    * Implement robust error handling for publishing and scheduling operations.

6.  **Performance:**
    * Optimize background processes and database queries for efficient performance.



Testing Requirements:

Yes, absolutely. Let's outline specific test cases and performance benchmarks for the drafts and scheduled publishing feature.

**Test Cases and Scenarios:**

1.  **Draft Creation and Management:**
    * **TC 1.1:** Create a new event and save it as a draft. Verify that the event status is "Draft."
    * **TC 1.2:** Edit a draft event and save the changes. Verify that the changes are saved and the status remains "Draft."
    * **TC 1.3:** Preview a draft event. Verify that the preview displays the event accurately.
    * **TC 1.4:** Delete a draft event. Verify that the event is removed from the drafts list.
    * **TC 1.5:** Create multiple drafts. Verify that they are all listed correctly.
    * **TC 1.6:** Verify that drafts are not publicly accessible.

2.  **Scheduled Publishing:**
    * **TC 2.1:** Schedule an event for future publishing. Verify that the event status is "Scheduled" and the scheduled date/time is stored correctly.
    * **TC 2.2:** Edit a scheduled event. Verify that the changes are saved and the scheduled date/time remains unchanged.
    * **TC 2.3:** Edit the scheduled date/time. Verify that the new date/time is stored.
    * **TC 2.4:** Cancel a scheduled publishing. Verify that the event is not published and the status reverts to "Draft."
    * **TC 2.5:** Verify that the event is automatically published at the scheduled time.
    * **TC 2.6:** Verify that scheduled events are not publicly accessible before the scheduled time.
    * **TC 2.7:** Schedule an event for a time within the next minute. Verify that it publishes.
    * **TC 2.8:** Schedule an event for a time in the past. Verify that the system provides an error.

3.  **Publishing:**
    * **TC 3.1:** Publish an event immediately. Verify that the event status is "Published" and it is publicly accessible.
    * **TC 3.2:** Edit a published event. Verify that the changes are visible to users.
    * **TC 3.3:** Verify the warning message when editing a published event.

4.  **Notifications:**
    * **TC 4.1:** Verify that a confirmation message is displayed when an event is published.
    * **TC 4.2:** Verify that an email or in-app notification is sent when an event is published.
    * **TC 4.3:** Verify that a confirmation message is displayed when an event is scheduled.
    * **TC 4.4:** Verify that an email or in-app notification is sent when an event is scheduled.
    * **TC 4.5:** Verify that an email or in-app notification is sent when the scheduled publishing occurs.

5.  **Error Handling:**
    * **TC 5.1:** Attempt to schedule an event with invalid date/time values. Verify that an error message is displayed.
    * **TC 5.2:** Verify that the system handles network errors or API failures gracefully.

6.  **Concurrency:**
    * **TC 6.1:** Simulate multiple users creating and publishing events simultaneously. Verify that the system handles concurrency correctly.

**Expected Performance Benchmarks:**

1.  **Draft Saving:**
    * **Benchmark 1.1:** Draft saving should complete within 1-2 seconds.

2.  **Scheduled Publishing:**
    * **Benchmark 2.1:** Scheduled publishing should occur within 1 minute of the scheduled time.
    * **Benchmark 2.2:** The background process or scheduled task should not impact the performance of other application features.

3.  **Publishing:**
    * **Benchmark 3.1:** Publishing an event should complete within 1-2 seconds.

4.  **Notification Delivery:**
    * **Benchmark 4.1:** Email or in-app notifications should be delivered within 1-2 minutes.

5.  **Concurrency:**
    * **Benchmark 5.1:** The system should be able to handle at least X concurrent users creating and publishing events without significant performance degradation (where X is a number based on your expected traffic).

6.  **API Response Times:**
    * **Benchmark 6.1:** API response times for draft saving, scheduling, and publishing should be consistently below Y milliseconds (where Y is a number based on your performance requirements).

**Important Notes:**

* These test cases and benchmarks should be adapted to your specific application requirements and infrastructure.
* Performance testing should be conducted under realistic load conditions.
* Use appropriate testing tools and frameworks to automate and execute these tests.
* Stress test the application to ensure that it can handle peak traffic.

