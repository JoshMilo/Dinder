from flask import Flask, render_template, request, jsonify
import requests


app = Flask(__name__)


@app.route("/hello")
def hello():
    return "hello world"


# @app.route("/", methods=['GET', 'POST'])
# def home():
#     if request.method == 'POST':
#         number1 = int(request.form.get('first'))
#         number2 = int(request.form.get('second'))
#         total = number1 + number2
#         sums = {"total": str(total)}
#         return jsonify(sums)
#     return render_template('index.html')

@app.route("/", methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        valueOne = request.form.get('first')
        valueTwo = request.form.get('second')
        url = 'https://api.github.com/search/users?q=location:{0}+language:{1}'.format(valueOne, valueTwo)
        response_dict = requests.get(url).json()
        return jsonify(response_dict)
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
