from flask import Flask, render_template

app = Flask(__name__)
app.config.from_object(__name__)

app.config['DEBUG'] = DEBUG = True

@app.route('/')
def home():
    return render_template('home.html', page_id='page-home', debug=DEBUG)

if __name__ == '__main__':
    app.run()
