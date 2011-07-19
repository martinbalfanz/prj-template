from flask import Flask, render_template

DEBUG = True

app = Flask(__name__)
app.config.from_object(__name__)

@app.route('/')
def home():
    return render_template('home.html', page_id='page-home', debug=DEBUG)

if __name__ == '__main__':
    app.run(debug=DEBUG)
