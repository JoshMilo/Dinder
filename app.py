from flask import Flask, render_template, request

app = Flask(__name__)


@app.route("/hello")
def hello():
    return "hello world"


@app.route("/", methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        value = int(request.form['number'])
        add_one = value + 1
        return render_template('index.html', value=add_one)
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
