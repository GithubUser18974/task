# task

Flutter Task For Job Interview 
to run it you must download the repo and ensure that all imports all correct 
then you run " Flutter Pub Get " to import the correct libraryies 
- -----------------------------------------------------------------
To run the app you will need a Flutter Version 3.24.X or lower  {tested and ran on 3.24.3}
-------------------------------------------------------------------
The consists of two pages :

First one showing numeric metrics about the orders: 
- total count 
- average price
- number of returns
- Pie Chart showing total order count with ordered , returned , delivered counts.

Second page showing a graph displaying the number of orders as the Y-axis
and time as the X-axis where you can filter period in three sections:
- Year  -> present all orders over each year.
- Month -> present orders in selected year on each month.
- DAY   -> present orders in selected month and year on each day.

- -----------------------------------------------------------------
Project is Created In Clean Arch. With MVVM.
it consists of : 
- Data   -> Contains DTOs , Serializations , Repo Implementations , Domain Mappers.
- Logic  -> Contains Entity , Use-Case , Repo Interface .
- Presentation -> Uses MVVM With Cubit as State Managements => consists of View , Manager , State .
For the Dependencies Injection I used GetIt in di folder .

- -----------------------------------------------------------------
Explanations :
I have 3 use Cases that uses the same repo {OrderRpo}
1- GetAllOrderUseCase -> Returns the Orders List.
2- GetOrderSummaryUseCase -> Returns the OrderSummary consists of orders count , total price , avg price.
3- GetFilterOrdersUseCase -> Return the Orders using Filter by date and groups the orders by same {year ,month , day} .

I have Two Manager to manage both pages both have 4 states init , data , loading , error
1- HomeManager -> It handles the home page summary state it gets the summary data using GetOrderSummaryUseCase .
2- OrderChartManager -> It handles the chart page state it gets the ordered grouped by the request stored in base state 
consists of the drop down value {Group Type} and selected date it uses the GetFilterOrdersUseCase to retrieve the data grouped.
