import os

from flask import Flask, current_app
from flask_restful import Api

from flask_restful import Resource

from random import randint


class Home(Resource):

    def get(self):
        rand_num = randint(0, 100)
        current_app.logger.info(f"Home endpoint called: Random Number {rand_num}")
        return {
            'hello': 'world',
            'number': rand_num
        }


def config():
    """Configuration for development environment."""
    app = Flask(__name__)
    app.secret_key = os.environ["FLASK_SECRET_KEY"]
    api = Api(app, prefix='/api')
    api.add_resource(Home, '/')
    return app, api
