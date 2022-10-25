import json
import sqlite3

class ServerManager:

    def __init__(self):
        con = sqlite3.connect("agisit.db")
        con.execute('''
        CREATE TABLE IF NOT EXISTS Calculations 
       (ID INTEGER PRIMARY KEY     AUTOINCREMENT NOT NULL, 
       NUM1           FLOAT    NOT NULL, 
       NUM2           FLOAT    NOT NULL, 
       OPERATION      TEXT     NOT NULL,
       RESULT         FLOAT    NOT NULL);
       ''')  
        con.close()

    def get(self):
        con = sqlite3.connect("agisit.db")
        res_list = []
        for num1, num2, operation, result in con.execute('''
        SELECT NUM1, NUM2, OPERATION, RESULT FROM Calculations;
        '''):
            res_list.append(f'{num1} {operation} {num2} = {result}')
        response = {'data' : res_list}
        con.close()
        return json.dumps(response)

    def post(self, num1, num2, op, result):
        con = sqlite3.connect("agisit.db")
        con.execute(f'INSERT INTO Calculations VALUES (21, 21, "+", 42)')
        con.commit()
        con.close()