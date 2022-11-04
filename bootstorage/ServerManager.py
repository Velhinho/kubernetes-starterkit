import json
import sqlite3

class ServerManager:

    def __init__(self):
        con = sqlite3.connect("agisit.db")
        con.execute('''
        CREATE TABLE IF NOT EXISTS calculations 
       (id INTEGER PRIMARY KEY     AUTOINCREMENT NOT NULL, 
       num1           FLOAT    NOT NULL, 
       num2           FLOAT    NOT NULL, 
       operation      TEXT     NOT NULL,
       result         FLOAT    NOT NULL);
       ''')  
        con.close()

    def get(self):
        con = sqlite3.connect("agisit.db")
        res_list = []
        for num1, num2, operation, result in con.execute('''
        SELECT num1, num2, operation, result FROM calculations;
        '''):
            res_list.append(f'{num1} {operation} {num2} = {result}')
        response = {'data' : res_list}
        con.close()
        return json.dumps(response)

    def post(self, num1, num2, op, result):
        con = sqlite3.connect("agisit.db")
        con.execute(f'INSERT INTO calculations (num1, num2, operation, result) VALUES ({num1}, {num2}, {op}, {result})')
        con.commit()
        con.close()