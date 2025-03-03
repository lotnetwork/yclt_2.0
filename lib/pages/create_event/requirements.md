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


Payment Processing:

Is there a specific payment gateway or provider integration required?
What is the payment flow for event creation? Is there a fixed fee or variable pricing model?
How are refunds handled if an event is canceled or modified?


User Permissions:

What validation is needed to ensure only authorized users can create events?
Are there any role-based permissions for event creation?


Field Validation:

Are there specific formatting requirements for fields like address, description, etc.?
What HTML tags are permitted in the description field?


Location Services:

How is the event location captured? Is there a map integration or address lookup?
Is geolocation required for events?


Backend Integration:

What specific API endpoints will be needed for event creation and management?
What is the expected data structure for the request/response?


Error Handling:

How should errors from the backend be presented to users?
Are there specific recovery flows if event creation fails?


Drafts and Publishing:

Is there a draft mode for events before they're published?
Can events be scheduled for future publishing?


Testing Requirements:

Are there specific test cases or scenarios that need to be addressed?
What are the expected performance benchmarks?
