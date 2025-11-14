from flask import Flask
import os
import socket

app = Flask(__name__)

# Obtener versión y color de variables de entorno
VERSION = os.getenv('APP_VERSION', 'v1.0.0')
COLOR = os.getenv('APP_COLOR', 'blue')

@app.route('/')
def hello():
    return {
        'message': f'Hello from {COLOR} app!',
        'version': VERSION,
        'color': COLOR,
        'hostname': socket.gethostname()
    }

@app.route('/health')
def health():
    return {'status': 'healthy', 'version': VERSION}

@app.route('/version')
def version():
    return {'version': VERSION, 'color': COLOR}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)