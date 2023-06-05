from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def index():
    return 'Index Page'

@app.route('/VouMeM')
def VouMeMatar():
    return 'Oi, eu vou me matar'

@app.route('/projects/')
def projects():
    return 'The project page'

@app.route('/about')
def about():
    return 'The about page'

@app.route('/login')
def login():
    return 'login'

@app.route('/user/<username>')
def profile(username):
    return f'{username}\'s profile'
