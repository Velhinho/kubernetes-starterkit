from flask import Flask, request
from ServerManager import ServerManager
from dotenv import load_dotenv
import os

app = Flask(__name__)
serverManager = ServerManager()

#TODO: Error handling? JSON validation?

@app.route("/api/bootstorage/operations", methods=["GET"])
def get():
    return serverManager.get()

@app.route("/api/bootstorage/create", methods=["POST"])
def post():
    payload = request.get_json()
    num1 = payload['num1']
    num2 = payload['num2']
    op = payload['op']
    result = payload['result']
    print(payload)
    serverManager.post(num1, num2, op, result)
    return {}
