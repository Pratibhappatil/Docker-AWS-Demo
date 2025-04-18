from flask import Flask

app = Flask(__name__)
@app.route('/')
def hello_world():
   return 'Heyyy....'

@app.route('/')
def health():
   return 'Server is UP...'