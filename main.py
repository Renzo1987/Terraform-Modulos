from flask import Flask
app = Flask(__name__)

@app.route('/   ')
def hola():
    return 'Bienvenidos'

if __name__ == '__main__':
    app.run_server(host="0.0.0.0", port=8080, debug=True)