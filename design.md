# Health Information Application System Design

## Design Architecture - Layered

### How the Layered Architecture Compliments our Design
The layered architecture fit our system best since we decided to implement the application by sections. Since our application supported multiple user active interfaces, we felt it was best to implement these in parts, and then connect said parts with the rest of the system. Another key to the implementing a layered architecture was our application using constant interfacing with the user, we have to constantly receive input, store that information and output corresponding information. The layered architecture allowed us to seperate our system into three components, or layers, the Presentation Layer, Persistence Layer, and Database Layer. <br>
<br>
![Layered Architecture](layered.png)
<br>
### Layer Functionality
The Presentation Layer is responsible for user interaction, here our system is responsible for creating the screens and multiple events within the application. These can be described as different sections of our application output to the user screen. Interfaces include the Health Information, Calendar, Doctor Information and Appointment Booking. <br>
<br>
The Persistence Layer is where all computation happens. Based off the information received through the Presentation Layer, our application creates a Person Class, with prescription and health attributes, and store in the Databse Layer. From this point, we use this class to interact with the rest of the system, such as creating a calendar event to keep track of the prescriptions being taken.<br>
<br>
The Database Layer is where we store all our information. Using a common iOS application database, Core Data, we can correctly input and output data to as our system needs. <br>
<br>




