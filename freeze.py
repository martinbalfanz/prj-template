from flask_frozen import Freezer
from prj import app

freezer = Freezer(app)

app.config.update(
    DEBUG = False,
    # FREEZER_BASE_URL = '',
    FREEZER_REMOVE_EXTRA_FILES = True
)

if __name__ == '__main__':
    freezer.freeze()
    # freezer.serve()
