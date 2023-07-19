import pymysql
import pymysql.cursors
from tabulate import tabulate
import subprocess as sp

def insertdata(conn):
    cur = conn.cursor()
    print("1. RESULTS\n2. DRIVERS' HALL OF FAME\n3. CONSTRUCTORS' HALL OF FAME\n4. EXIT")
    while(1):
        in1 = int(input("Which table would you like to insert into?"))
        if in1 == 4:
            return
        if in1 < 1 or in1 > 4:
            print("Invalid input. Please try again.")
            continue
        else:
            break
    if in1 == 1:

        try:
            data = {}
            data["name1"] = input("Enter first name: ")
            data["name2"] = input("Enter last name: ")
            data["const"] = input("Enter constructor: ")
            data["champ"] = input("Enter championship: ")
            data["race"] = input("Enter race: ")
            data["posn"] = int(input("Enter position: "))
            data["points"] = int(input("Enter points: "))

            query1 = """INSERT INTO `RESULTS2` VALUES('%s', '%s', '%s', '%s', '%s', %d)""" % (data["name1"], data["name2"], data["const"], data["champ"], data["race"], data["posn"])
            query2 = """INSERT INTO `RESULTS3` VALUES('%s', '%s', '%s', '%s', %d, %d)""" % (data["name1"], data["name2"], data["champ"], data["race"], data["posn"], data["points"])
            print(query1)
            cur.execute(query1)
            conn.commit()
            print(query2)
            cur.execute(query2)
            conn.commit()
            print("Insertion successful.")
        except:
            print("Insertion failed. Please try again.")
            conn.rollback()
        finally:
            cur.close()
    
    if in1 == 2:
        try:
            data = {}
            data["name1"] = input("Enter first name: ")
            data["name2"] = input("Enter last name: ")
            data["points"] = int(input("Enter points: "))
            data["year"] = int(input("Enter year: "))
            data["champ"] = input("Enter championship: ")

            query1 = """INSERT INTO `DRIVERS' HALL OF FAME` VALUES('%s', '%s', %d, %d, '%s')""" % (data["name1"], data["name2"], data["points"], data["year"], data["champ"])
            print(query1)
            cur.execute(query1)

            conn.commit()

            print("Insertion successful.")
        except:
            print("Insertion failed. Please try again.")
            conn.rollback()
        finally:
            cur.close()
    
    if in1 == 3:
        try:
            data = {}
            data["const"] = input("Enter constructor name: ")
            data["points"] = int(input("Enter points: "));
            data["year"] = int(input("Enter year: "))
            data["champ"] = input("Enter championship: ")

            query1 = """INSERT INTO `CONSTRUCTORS' HALL OF FAME` VALUES('%s', %d, %d, '%s')""" % (data["const"], data["points"], data["year"], data["champ"])
            cur.execute(query1)
            conn.commit()
            print("Insertion successful.")
        except:
            print("Insertion failed. Please try again.")
            conn.rollback()
        finally:
            cur.close()

    
def remove_race(conn):
    cur = conn.cursor()
    query = "SELECT RACE2.`Race Number`, RACE2.Championship, RACE4.Country, RACE3.Name, RACE2.Year FROM RACE2, RACE3, RACE4 where RACE2.`Race Number` = RACE3.`Race Number` and RACE2.`Race Number` = RACE4.`Race Number`"
    cur.execute(query)
    result = cur.fetchall()
    header = result[0].keys()
    rows = [x.values() for x in result]
    print(tabulate(rows, header, tablefmt="grid"))
    print("Which race do you wish to remove from the calendar (specify race number)")
    in1 = int(input())
    try:
        query = """SET FOREIGN_KEY_CHECKS = 0"""
        cur.execute(query)
        conn.commit()
        query1 = """DELETE FROM RACE3 WHERE `Race Number` = %d""" % (in1)
        query2 = """DELETE FROM RACE4 WHERE `Race Number` = %d""" % (in1)
        query3 = """DELETE FROM RACE2 WHERE `Race Number` = %d""" % (in1)
        print(query1)
        cur.execute(query1)
        conn.commit()
        print(query2)
        cur.execute(query2)
        conn.commit()
        print(query3)
        cur.execute(query3)
        conn.commit()
        print("Deletion successful.")
    except:
        print("Deletion failed. Please try again.")
        conn.rollback()



def EoSOperations(conn):
    cur = conn.cursor()
    while(1):
        in1 = input("Is championship over? (Y/N)");
        if in1 == 'Y' or in1 == 'y':
            break
        elif in1 == 'N' or in1 == 'n':
            print("Not permitted")
            return
        else:
            print("Invalid input. Please try again.")
            continue
    print("Updating Drivers' HoF and Constructors' HoF")
    dhofquery = """INSERT INTO `DRIVERS' HALL OF FAME` \
                SELECT `First Name`, `Last Name`, Points, Year, Championship \
                FROM `DRIVERS' CHAMPIONSHIP` \
                WHERE Position = 1"""
    chofquery = """INSERT INTO `CONSTRUCTORS' HALL OF FAME` \
                SELECT `Constructor Name`, Points, Year, Championship \
                FROM `CONSTRUCTORS' CHAMPIONSHIP` \
                WHERE Position = 1"""
    try:
        cur.execute(dhofquery)
        cur.execute(chofquery)
        conn.commit()
        print("Update successful.")
        d1 = "DELETE FROM `DRIVERS' CHAMPIONSHIP`"
        d2 = "DELETE FROM `CONSTRUCTORS' CHAMPIONSHIP`"
        # d3 = "DELETE FROM `RESULTS2`"
        # d4 = "DELETE FROM `RESULTS3`"
        # d5 = "DELETE FROM `RESULTS4`"
        try:
            cur.execute(d1)
            cur.execute(d2)
            conn.commit()
            print("Deletion from Drivers' and Constructors' Championship successful.")
        except:
            print("Deletion from Drivers' and Constructors' Championship failed. Please try again.")
            conn.rollback()
        

    except:
        print("Update failed. Please try again.")
        conn.rollback()
    


def view_standings(conn):
    cur = conn.cursor()
    print("1. Drivers' Championship")
    print("2. Constructors' Championship")
    print("3. Drivers' Hall of Fame")
    print("4. Constructors' Hall of Fame")
    print("5. Go back")
    in1 = int(input())

    if in1 == 1:
        query1 = "SELECT DISTINCT Championship FROM `DRIVERS' CHAMPIONSHIP`"
        cur.execute(query1)
        result = cur.fetchall()
        chs = []
        for row in result:
            chs.append(row['Championship'])
            print(row['Championship'], end=" ")
        while(1):
            in1 = input("\nWhich championship do you wish to view? Please enter exact name: ")
            if in1 in chs:
                break
            else:
                print("Invalid input. Please try again.")
                continue
        query = "SELECT * FROM `DRIVERS' CHAMPIONSHIP` where Championship = '%s' ORDER BY Position" % (in1)
        cur.execute(query)
        result = cur.fetchall()
        header = result[0].keys()
        rows = [x.values() for x in result]
        print(tabulate(rows, header, tablefmt="grid"))

    elif in1 == 2:
        query1 = "SELECT DISTINCT Championship FROM `CONSTRUCTORS' CHAMPIONSHIP`"
        cur.execute(query1)
        result = cur.fetchall()
        chs = []
        for row in result:
            chs.append(row['Championship'])
            print(row['Championship'], end=" ")
        
        while(1):
            in1 = input("\nWhich championship do you wish to view? Please enter exact name: ")
            if in1 in chs:
                break
            else:
                print("Invalid input. Please try again.")
                continue
        query = "SELECT * FROM `CONSTRUCTORS' CHAMPIONSHIP` WHERE Championship = '%s'" % (in1)
        cur.execute(query)
        result = cur.fetchall()
        header = result[0].keys()
        rows = [x.values() for x in result]
        print(tabulate(rows, header, tablefmt="grid"))

    elif in1 == 3:
        query1 = "SELECT DISTINCT Championship FROM `DRIVERS' HALL OF FAME`"
        cur.execute(query1)
        result = cur.fetchall()
        chs = []
        for row in result:
            chs.append(row['Championship'])
            print(row['Championship'], end=" ")
        while(1):
            in1 = input("\nWhich championship do you wish to view? Please enter exact name: ")
            if in1 in chs:
                break
            else:
                print("Invalid input. Please try again.")
                continue
        query = "SELECT * FROM `DRIVERS' HALL OF FAME` WHERE Championship = '%s'" % (in1)
        cur.execute(query)
        result = cur.fetchall()
        header = result[0].keys()
        rows = [x.values() for x in result]
        print(tabulate(rows, header, tablefmt="grid"))
        
            
    elif in1 == 4:
        query1 = "SELECT DISTINCT Championship FROM `CONSTRUCTORS' CHAMPIONSHIP`"
        cur.execute(query1)
        result = cur.fetchall()
        chs = []
        for row in result:
            chs.append(row['Championship'])
            print(row['Championship'], end=" ")
        while(1):
            in1 = input("\nWhich championship do you wish to view? Please enter exact name: ")
            if in1 in chs:
                break
            else:
                print("Invalid input. Please try again.")
                continue
        query = "SELECT * FROM `CONSTRUCTORS' HALL OF FAME`  WHERE Championship = '%s'" % (in1)
        cur.execute(query)
        result = cur.fetchall()
        header = result[0].keys()
        rows = [x.values() for x in result]
        print(tabulate(rows, header, tablefmt="grid"))
    elif in1 == 5:
        return
    else:
        print("Invalid input. Please try again.")
        return

def updateDriversChampionship(conn):
    cur = conn.cursor()
    query1 = "SELECT DISTINCT Championship FROM `DRIVERS' CHAMPIONSHIP`"
    cur.execute(query1)
    result = cur.fetchall()
    chs = []
    for row in result:
        chs.append(row['Championship'])
        print(row['Championship'], end=" ")
    while(1):
        in1 = input("\nWhich championship do you wish to update? Please enter exact name: ")
        if in1 in chs:
            break
        else:
            print("Invalid input. Please try again.")
            continue
    query = """SELECT `First Name`, `Last Name` FROM `DRIVERS' CHAMPIONSHIP` where Championship = '%s'""" % (in1)
    cur.execute(query)
    result = cur.fetchall()
    drivers = {}
    dindex = 1
    for row in result:
        drivers[dindex] = [row['First Name'], row['Last Name']]
        print(str(dindex) + "-" + row['First Name'] + " " + row['Last Name'])
        dindex += 1

    while(1):
        in2 = int(input("Which driver do you wish to update? Please enter the corresponding number: "))
        if in2>1 or in2<dindex:
            break
        else:
            print("Invalid input. Please try again.")
            continue

    print("\n1. Update points")
    print("2. Update position")
    print("3. Don't perform update")
    while(1):
        in4 = int(input("What do you wish to update? Please enter the corresponding number: "))
        if in4 == 1:
            while(1):
                in3 = int(input("Enter new points: "))
                if in3 >= 0:
                    break
                else:
                    print("Invalid input. Please try again.")
                    continue
            query = """UPDATE `DRIVERS' CHAMPIONSHIP` SET Points = %d WHERE Championship = '%s' AND `First Name` = '%s' AND `Last Name` = '%s'""" % (in3, in1, drivers[in2][0], drivers[in2][1])
            try:
                cur.execute(query)
                conn.commit()
                print("Update successful.")
            except:
                print("Update failed. Please try again.")
                conn.rollback()
            break
        elif in4 == 2:
            while(1):
                in3 = int(input("Enter new position: "))
                if in3 >= 0:
                    break
                else:
                    print("Invalid input. Please try again.")
                    continue
            query = """UPDATE `DRIVERS' CHAMPIONSHIP` SET Position = %d WHERE Championship = '%s' AND `First Name` = '%s' AND `Last Name` = '%s'""" % (in3, in1, drivers[in2][0], drivers[in2][1])
            try:
                cur.execute(query)
                conn.commit()
                print("Update successful.")
            except:
                print("Update failed. Please try again.")
                conn.rollback()
            break
        elif in4 == 3:
            return
        else:
            print("Invalid input. Please try again.")
            continue

def updateConstructorsChampionship(conn):
    cur = conn.cursor()
    query1 = "SELECT DISTINCT Championship FROM `CONSTRUCTORS' CHAMPIONSHIP`"
    cur.execute(query1)
    result = cur.fetchall()
    chs = []
    for row in result:
        chs.append(row['Championship'])
        print(row['Championship'], end=" ")
    while(1):
        in1 = input("\nWhich championship do you wish to update? Please enter exact name: ")
        if in1 in chs:
            break
        else:
            print("Invalid input. Please try again.")
            continue
    query = """SELECT `Constructor Name` FROM `CONSTRUCTORS' CHAMPIONSHIP` where Championship = '%s' """ % (in1)
    print(query)
    cur.execute(query)
    result = cur.fetchall()
    constructors = {}
    cindex = 1
    for row in result:
        constructors[cindex] = row['Constructor Name']
        print(str(cindex) + "-" + row['Constructor Name'])
        cindex += 1
    
    while(1):
        in2 = int(input("Which constructor do you wish to update? Please enter the corresponding number: "))
        if in2>1 or in2<cindex:
            break
        else:
            print("Invalid input. Please try again.")
            continue

    print("\n1. Update points")
    print("2. Update position")
    print("3. Don't perform update")
    while(1):
        in1 = int(input("What do you wish to update? Please enter the corresponding number: "))
        if in1 == 1:
            while(1):
                in3 = int(input("Enter new points: "))
                if in3 >= 0:
                    break
                else:
                    print("Invalid input. Please try again.")
                    continue
            query = """UPDATE `CONSTRUCTORS' CHAMPIONSHIP` SET Points = %d WHERE Championship = '%s' AND `Constructor Name` = '%s'""" % (in3, in1, constructors[in2])
            try:
                cur.execute(query)
                conn.commit()
                print("Update successful.")
            except:
                print("Update failed. Please try again.")
                conn.rollback()
            break
        elif in1 == 2:
            while(1):
                in3 = int(input("Enter new position: "))
                if in3 >= 0:
                    break
                else:
                    print("Invalid input. Please try again.")
                    continue
            query = """UPDATE `CONSTRUCTORS' CHAMPIONSHIP` SET Position = %d WHERE Championship = '%s' AND `Constructor Name` = '%s'""" % (in3, in1, constructors[in2])
            try:
                cur.execute(query)
                conn.commit()
                print("Update successful.")
            except:
                print("Update failed. Please try again.")
                conn.rollback()
        elif in1 == 3:
            return
        else:
            print("Invalid input. Please try again.")
            continue
        

def update(conn):
    print("1. Update Drivers' Championship")
    print("2. Update Constructors' Championship")
    print("3. Exit")
    in1 = int(input())
    if in1 == 1:
        updateDriversChampionship(conn)
    elif in1 == 2:
        updateConstructorsChampionship(conn)
    elif in1 == 3:
        return

def result_view(conn):
    cur = conn.cursor()
    print("1. View results of one driver")
    print("2. EXIT")
    while(1):
        in1 = int(input("What do you wish to view? Please enter the corresponding number: "))
        if in1 == 1:
            query = "SELECT DISTINCT `First Name`, `Last Name` FROM `RESULTS2`"
            cur.execute(query)
            result = cur.fetchall()
            drivers = {}
            dindex = 1
            for row in result:
               drivers[dindex] = [row['First Name'], row['Last Name']]
               print(str(dindex) + "-" + row['First Name'] + " " + row['Last Name'])
               dindex += 1
            while(1):
                in2 = int(input("Which driver's results do you wish to view? Please enter the corresponding number: "))
                if in2>1 or in2<dindex:
                    break
                else:
                    print("Invalid input. Please try again.")
                    continue

            query = "SELECT DISTINCT RESULTS2.Race, RESULTS3.Position, RESULTS3.Points FROM RESULTS2, RESULTS3 WHERE RESULTS2.`First Name` = '%s' and RESULTS2.`Last Name` = '%s' \
                AND RESULTS2.`First Name` = RESULTS3.`First Name` AND RESULTS2.`Last Name` = RESULTS3.`Last Name` AND RESULTS2.Position = RESULTS3.Position" % (drivers[in2][0], drivers[in2][1])
            cur.execute(query)
            result = cur.fetchall()
            header = result[0].keys()
            rows = [x.values() for x in result]
            print(tabulate(rows, header, tablefmt="grid"))
            
        elif in1 == 2:
            return
        else:
            print("Invalid input. Please try again.")
            continue


def exec(val, conn, privilege):
    if val == 1:
        if privilege == 1:
            insertdata(conn)
        else:
            print("You do not have the required privileges to perform this operation.")
    elif val == 2:
        if privilege == 1:
            remove_race(conn)
        else:
            print("You do not have the required privileges to perform this operation.")
    elif val == 3:
        if privilege == 1:    
            EoSOperations(conn)
        else:
            print("You do not have the required privileges to perform this operation.")
    elif val == 4:
        view_standings(conn)
    elif val == 5:
        if privilege == 1:
            update(conn)
    elif val == 6:
        result_view(conn)


try:
    connection = pymysql.connect(host='localhost', port=30306, user="root", password="Kapu#2004",
                                    db="dna", cursorclass=pymysql.cursors.DictCursor)
    if(connection.open):
        print("Connection Successful")
    else:
        print("Connection Failed")

    privilege = 0
    admin_pwd = "vettelgoat"
    while(1):
        input1 = input("Are you an admin? (Yy/Nn)")
        if input1 in ['Y','y','n','N']:
            if input1 in ['Y','y']:
                input2 = input("Enter admin password: ")
                if input2 == admin_pwd:
                    print("Successful authentication")
                    privilege = 1
                else:
                    print("Wrong password")
                    privilege = 0
                break
            elif input1 in ['N','n']:
                print("You will be logged in as a normal user.")
                privilege = 0
                break
    
    tmp = input("Press any key to continue:")

    #cur = connection.cursor()

    while(1):
        print("1. Insert data (RESULTS/DRIVER HoF/CONSTRUCTOR HoF)")
        print("2. Delete race from calendar")
        print("3. Flush tables (EoS)")
        print("4. View current standings")
        print("5. Update championship data")
        print("6. View results")
        print("7. EXIT")
        input1 = int(input("Enter your choice: "))
        if input1 == 7:
            exit()
        elif input1 > 7 and input1 < 1:
            print("Invalid choice")
            tmp = input("Press any key to continue:")
        else:
            exec(input1, connection, privilege)

except Exception as e:
    print("Error: ",e)
    print("Connection refused")
    tmp = input("Press any key to continue:")    