from flask import Flask, render_template

app = Flask(__name__)
app.config.from_object(__name__)

app.config['DEBUG'] = True

@app.route('/')
def home():
    return render_template('home.html', page_id='page-home')

if __name__ == '__main__':
    app.run()
