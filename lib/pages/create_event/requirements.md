You will be implementing the new create event screen.  Write all new code including the locations where to be  placed within the application.  This new screen will be using some code and screens that are already part of the existing attached app.  If your requirement is to add additional code to any of the existing files then make the necessary (and only if necessary) changes that warrant the support of the new code.  Any existing code you modify, is to maintain the original look and feel from the initial app.  Please Review and analyze thoroughly whatever changes or additions you implement.  Thoroughly check you codes, for consistency, correctness and proper syntax.  Please check your code to not include any depreciation.   You are to maintin the existing code as it is, Before you proceed ask any questions you may have before writing any code or designing any screen.
Here are your requirements:
Comprehensive Development Requirements for the Create Event Process

Objective
To implement a seamless, user-friendly, and efficient "Create Event" process, integrated with the Yard Closet app. This process will:
Start from the user profile screen via the "Create Yard Closet Event" button.
Guide users through creating, validating, and publishing events.
Include a payment process utilizing the existing payment method screen already implemented in the app.
Allow users to edit or delete their events after creation, with appropriate restrictions and refund handling.
Ensure real-time synchronization, security, and high performance.

1. Entry Point
Location
The process begins from the User Profile Screen with a button labeled "Create Yard Closet Event".
Action
When the button is tapped, the app navigates to the Create Event Screen.

2. Create Event Screen Functionality
Required Fields
The following fields must appear on the screen in the following order:
Gallery Images: Upload functionality for event cover and gallery images.
Event Title: Text input field for the event title.
Event Category: Multi-select dropdown populated with categories fetched from the database.
Event Description:
Brief Description: Short summary of the event.
Full Description: Detailed event information.
Event Duration: Dropdown (fetched from the database) with the following options:
1-day ($11.00)
2-days ($19.00)
3-days ($28.00)
Price:
Auto-populated based on the selected event duration.
Displayed as a read-only field.
Schedule:
Expandable sections for selecting up to 3 date/time combinations.
Each section includes:
Start Date
End Date
Start Time
End Time
Venue Address: Text input for the event location.
Latitude:
Read-only field populated on publishing using a geocoding service.
Longitude:
Read-only field populated on publishing using a geocoding service.
Publish Button: Finalizes event creation.
UI/UX Enhancements
Inline validation for all fields.
Expandable sections for schedule inputs to avoid clutter.
Descriptive labels and placeholders for user guidance.
Visual hierarchy with grouped fields and spacing.

3. Validation
Before Publishing
Mandatory Fields: Ensure all required fields are completed.
Data Formatting:
Dates must be in valid formats.
Start times must precede end times.
No overlapping schedules.
Terms of Service: Ensure the user agrees to the disclaimer before enabling the "Publish" button.

4. Publish and Payment Process
Step 1: Validation
On tapping the "Publish" button:
Validate all inputs.
If validation fails, display error messages inline.
Step 2: Navigation to Payment Screen
Navigate to the existing Payment Method screen.
Pass the following details:
Event Name.
Total Price (calculated based on event duration).
User-selected details for review.
Step 3: Payment Options
Utilize the existing payment process to:
Allow users to select a payment method and complete the transaction.
Ensure proper integration with existing payment gateways (Stripe, RazorPay, PayPal).
Step 4: Post-Payment Actions
On Successful Payment:
Save event data to MongoDB via an intermediary API.
Update the event status to "Published."
Notify the user of successful event publication.
Redirect the user to the main app screen with a success message.
On Payment Failure:
Display an error message.
Allow the user to retry or return to the Create Event screen.

5. Edit and Delete Functionality
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
Refund Handling:
Charge a $5.00 refund fee for event deletion.
Reference the Terms of Service during this transaction.
Upon deletion:
Update the event status to "Deleted."
Notify the user of the successful deletion and refund.

6. Backend Requirements
API Endpoints
POST /api/events:


Save user-created event data to MongoDB.
Validate inputs and sanitize data.
Handle geocoding to populate latitude and longitude fields.
PUT /api/events/{id}:


Update existing event data based on user edits.
Validate inputs and ensure the event has not yet started.
DELETE /api/events/{id}:


Mark the event as deleted and process the refund fee.
Update event status in MongoDB.
Fail-Safe Mechanism
If MongoDB write fails, temporarily store the data in Firebase.
Use a background service to sync data from Firebase to MongoDB.
Real-Time Synchronization
Use WebSocket or Firebase Realtime Database to ensure newly created, edited, or deleted events are immediately visible to other users.
Notifications
Notify users of successful event creation, updates, or deletions via:
Push notifications (Firebase Cloud Messaging).
In-app dialog or toast message.

7. Security Considerations
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

8. Post-Publishing Actions
Event Visibility
Ensure newly created, edited, or deleted events are immediately visible in the app.
Navigation
Redirect users to:
The main app screen or event details page on successful event creation, edit, or deletion.
The Create Event screen on payment failure with pre-filled data.

9. Development Best Practices
Code Modularity:
Separate logic for frontend UI, backend API, and database interactions.
Performance Optimization:
Cache frequently used data (e.g., categories) to reduce API calls.
Optimize image uploads for faster processing.
User Experience:
Provide clear instructions and error messages.
Ensure all interactions are intuitive and responsive.

10. Deliverables
Fully functional Create Event screen integrated into the user profile.
Payment process implementation utilizing the existing Payment Method screen.
Edit and delete functionality for user-created events.
Backend API for event creation, updates, deletions, and synchronization.
Real-time updates and notifications for users.
Documentation for developers and QA teams.

This document ensures the Create Event process is user-friendly, secure, and aligned with industry best practices. Let me know if additional details are needed!

Additional questions you asked, answered:
Integration Points:
Should the "Create Yard Closet Event" button directly replace or extend any existing functionality in the User Profile screen, or will it be added as a completely new feature?
Within the code folder (yardcloset.zip), in the file: profile_componant_widget.dart
Located lib/pages/profile_flow/profile_componant/profile_componant_widget.dart
Within the file starting about line 735, is where the  "Create Yard Closet Event" is defined
Use the existing logic and this button to start your development of the Create Event process. 
Is there a specific design guideline for the button (e.g., placement, color, style)?
This button is already designed as the other buttons on this screen.
Payment Screen Integration:
Should the payment screen reuse an existing method? Yes use existing method.  Can you confirm whether any dynamic data (like event duration cost) is already being calculated, or should it be implemented from scratch? 
 The event duration cost is a flat fee and no other calculations are applied.
Editing/Deleting Events:
Are there existing components in the app for editing and deleting? If not, should these functionalities follow a similar flow/UI as the create event process?  
Yes, these edit/delete functionalities follow a similar flow/UI as the create event process
Backend APIs:
Are the backend endpoints for creating, updating, and deleting events already implemented in the application, or is it expected that these will need to be developed alongside the front-end? Use a Dedicated Backend API 
1. Backend APIs for Creating, Updating, and Deleting Events
Current Situation:
The app primarily uses Firebase Firestore, and there’s no indication of a MongoDB-specific backend API for handling event operations.
Solution with Approach 1:
A dedicated backend API can provide endpoints for creating, updating, and deleting events in MongoDB.
The API serves as a single, centralized entry point for all database interactions. For example:
POST /api/events: Create a new event.
PUT /api/events/:id: Update an existing event.
DELETE /api/events/:id: Delete an event.
The Flutter app interacts with this API, ensuring that user-supplied data is written to MongoDB efficiently.
By implementing this, you ensure that event management operations are fully supported in MongoDB without disrupting the current app logic.


Database Synchronization:
Can you confirm whether Firebase Realtime Database or WebSocket support is already configured in the app? If not, should it be included as part of the scope?

2. Database Synchronization with Firebase/WebSocket
Current Situation:
Firebase Firestore is already used for data retrieval and real-time synchronization.
MongoDB integration for data writing could introduce complexity if handled directly in the app.
Solution with Approach 1:
The backend API can:
Write data to MongoDB.
Optionally update Firebase Firestore for real-time sync (if Firestore continues to be used for display purposes).
Example Flow:
The Flutter app sends event data to the API.
The API writes the data to MongoDB.
(Optional) The API updates Firestore for real-time updates visible in the app.
This approach ensures synchronization between MongoDB and Firebase without requiring WebSocket support or duplicating logic in the app.


Geocoding Service:
Are there any preferred geocoding APIs or services for populating latitude and longitude, or should this integration be decided during development?
MapBox will be used for Geocoding, during development provide a placeholder for dummy API key the will be swapped for an active key during testing.

Are the instructions and requirements clear and concise to proceed?
