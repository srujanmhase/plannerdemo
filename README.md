# plannerdemo
Code repository for the planner demo app built with flutter

## A Smart Order Management System with automatic employee task assignment and Order Status tracking for efficient interdepartmental synergy.

## Technologies:
•	Object Oriented Programming with Dart
•	Cross platform application development using Flutter
•	Firebase Authentication
•	Firestore (NoSQL Database)

## Abstract
In any enterprise, the efficiency of order management and fulfilment play a major role while directly influencing its key performance indicators. Key processes in the industry are managed in a “supply chain” i.e., several successive steps in the process are directly dependant on personnel responsible for the preceding step. Any mishap, tribulation or a delay may have a rippling effect on all the successive steps and may trigger a slew of Mutually Exacerbating Catastrophes that might be difficult to contain. 
Taking cognizance to this issue, I have attempted to build a resilient and effective yet simple solution to dynamically allocate tasks across multiple teams/departments that will result in minimal friction and to create a simple streamlined user interface to view the status of the same.

## Background Information
Organisations traditionally operate in “silos” wherein different departments work in their own isolated purviews and inter-departmental synergy, though very much a necessity, remains difficult to implement. The main objective is to enable a single window solution to create new orders, dynamically distribute those tasks to employees across different departments and a streamlined view of their status.
Features
•	Create new order
•	Dynamically distribute tasks related to the order to employees across different departments with the least number of active tasks at any given time
•	Enable a certain level of department specific functionality
•	Track the status of the fulfilment process in a single window and easily address any potential problems.
•	Manage and edit orders

## Working Video
[![Alt text](https://img.youtube.com/vi/plYQncbg21Q/0.jpg)](https://www.youtube.com/watch?v=plYQncbg21Q)

## Packages Used
  cloud_firestore: ^0.16.0
  firebase_core: ^0.7.0
  firebase_auth: ^0.20.0+1
  shared_preferences: ^0.5.12+4
  rounded_loading_button: ^1.0.18
  uuid: ^2.2.2
  google_fonts: ^1.1.1
  
## Data Storage Schema
![alt text](https://github.com/srujanmhase/plannerdemo/blob/main/screenshots/Data%20Map.jpg)

In traditional Relational databases, a convention followed is that data must not be duplicated in multiple locations, however, in NoSQL databases the data might be duplicated in certain situations in order to make querying faster and incur less number of read operations. The figure Fig(1) above is a schema of the database used to store and manage information in this project.
uid – Stands for Unique Identification of the user. This value can be programatically generated at any situation that may need it for record keeping purposes. In this case, the uid here is generated by Firebase Authentication for authenticating a user.

## Firebase Auth
![alt text](https://github.com/srujanmhase/plannerdemo/blob/main/screenshots/auth.JPG)

For the purpose of demonstrating, a total of 8 users have been created using the app itself. Two users of 4 departments each. Note the orderState (the current state of the order) is same as the name of the department which is supposed to complete it.

## Task Pipeline
![alt text](https://github.com/srujanmhase/plannerdemo/blob/main/screenshots/taskPipeline.png)

By way of illustration, if the order is being “planned” i.e., the order status is “planning” the “planning” department (the user belonging to the userRole == ‘planning’) must work on the project and mark “planning” as done. When the user does that, the modifyOrder method will update the orderStatus as the succesive one as defined by the task pipeline (shown in fig(3).)

## Crating a new order Process Workflow
To create a new order, the current user must be assigned with the user role of “sales”. If logged in with any account assigned a role other than “sales”, an empty container will be painted in place of a button navigating to the create order form.
Once the itemName, itemQty and the itemSKU have been entered, the createOrder service will assign the “planning”, “purchasing” and “manufacturing” tasks for that particular order to users with the respective roles. For that, it will access the top level collection of the role for which it is assigning task to for eg. “planning” top level collection, then it will create a local map of all the users registered as “planning” roles in key value pair stores where the key will be the uid(s) and the value will be the value of “tasks” (which indicates the active tasks). Then it will sort the map with respect to the values in ascending order and then return the key of the first index. It will be the uid with the least number of active tasks for that role at that particular time. This process will be repeated for all roles. 

![alt text](https://github.com/srujanmhase/plannerdemo/blob/main/screenshots/createNewOrderNew.png)

![alt text](https://github.com/srujanmhase/plannerdemo/blob/main/screenshots/generateUid.png)

Above flowchart illustrates the process for assigning the uid(s) for each role: planning, purchasing and manufacturing. It details the process workflow of getting all the tasks, mapping the active tasks to the user ids and choosing the one with the lowest active tasks.

![alt text](https://github.com/srujanmhase/plannerdemo/blob/main/screenshots/generateSalesUid.png)

Since only users with the role “sales” can create new orders, the salesPersonnel for the order being created will be the currentUser.uid

## Modifying Order Status

![alt text](https://github.com/srujanmhase/plannerdemo/blob/main/screenshots/modifySequence.png)
The above figure details the conditions required for the user and the existing orderStatus to be able to modify or update the targetOrder ‘s status. When the conditions are met, the order status is incremented to the successive order status as defined in the task pipeline.

## Displaying Order Details
![alt text](https://github.com/srujanmhase/plannerdemo/blob/main/screenshots/getOrders.png)

##Please download the Project Report Docx to see the database status after each action.