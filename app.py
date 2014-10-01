from flask import Flask, render_template, request, jsonify

app = Flask(__name__)


@app.route("/hello")
def hello():
    return "hello world"


@app.route("/", methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        number1 = int(request.form.get('first'))
        number2 = int(request.form.get('second'))
        total = number1 + number2
        sums = {"total": str(total)}
        return jsonify(sums)
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
