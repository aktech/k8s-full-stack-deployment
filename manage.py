import logging
import os

from backend import app

logging_format = "%(asctime)s %(levelname)9s %(lineno)4s %(module)s: %(message)s"
logging.basicConfig(level=logging.INFO, format=logging_format)
logging.getLogger('backoff').addHandler(logging.StreamHandler())

app, api = app.config()


if __name__ == '__main__':
    debug = False
    debug_var = str(os.environ.get('DEBUG', 0))
    if debug_var.isnumeric():
        debug = True if int(debug_var) == 1 else False
    logging.info(f"Starting Flask server, with debug: {debug}")

    app.run(
        host='0.0.0.0',
        port=os.environ.get('FLASK_APP_PORT', 8080),
        debug=debug,
        threaded=True
    )
