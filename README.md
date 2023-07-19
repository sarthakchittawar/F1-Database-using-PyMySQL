# Motorsports Database using PyMySQL

## Notes to the evaluator

1. A Max of 5 drivers' results are stored in the 2 results tables for Formula1, and 3 for MotoGP
2. There are 22 drivers in f1 database and 6 in motogp
3. Drivers' Championship & Construictors' Championship contains the current standings of the current season of whatever motorsport.
4. The Races table contain only that data which pertains to the current season of motorsport.
5. Drivers' Hall of Fame has data of all drivers who won the F1/MotoGP World Championships from 2000 to 2021.
6. Constructors' Hall of Fame has data of all constructors who won the F1/MotoGP World Championships from 2000 to 2021.
7. After a season is over, we ask the user for permission to shift data into the hall of fame.
8. Race, and both hall of fame tables are weak entities.
9. This database is detailed enough to provide much more functionalities than we already have.
10. We have used PyMySQL to code the CLI, which connects to the database we've provided.
11. We have added a `Race Number` attribute to RACE2
12. We have developed the CLI on python using the PyMySQL library.
13. database.sql has the .sql file which can be cop-pasted onto an sql instance, and main.py has the CLI code

* NOTE: Since the video took up too much space, we could not submit it in an mp4 format, hence the link to the video: https://iiitaphyd-my.sharepoint.com/:v:/g/personal/kapil_rajesh_students_iiit_ac_in/EfDd56D8HE1Gg7s7H3kMRl4BuivS94ENfMJhyPhA-c8i_g?e=CSPQQv

## Queries implemented
We have implemented a total of 6 queries:
1. Insert data (RESULTS/DRIVER HoF/CONSTRUCTOR HoF) -
   * This can only be done by the administrator (we have authenticated this feature). We have another menu which asks the admin on which table to add data to. We have used commits to make the entered data permanent.
   * Satisfies the insertion functional requirement.

3. Delete race from calendar -
   * In many situations such as Russian GP 2022, the races may be cancelled due to political/financial issues, hence this is required.
   * Satisfies the deletion functional requirement.

3. Flush Tables (EoS) -
   * Basically, after the end of all championships in a calendar year, we will determine the championship winners and place them in the Hall of Fame of respective championship types.
   * Such tables like Driver, Constructor, etc are cleared at the end of each year.
   * Satisfies the deletion + insertion functional requirement, and the projection + aggregate functional requirement

4. View current standings -
   * The current ranklist (based on points) of the drivers is shown to the user. This helps in statistics of any form which the user would like to do.
   * Satisfies the selection functional requirement.

5. Update championship data -
   * The user can update the championship points/position/etc of a driver/constructor by using this feauture of the menu.
   * Satisfies the modification functional requirement.

6. View results -
   * Gives the results of the races you want to see.
   * Satisfies the selection functional requirement
