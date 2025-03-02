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



Are the instructions and requirements clear and concise to proceed?
