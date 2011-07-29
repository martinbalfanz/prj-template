from flaskext.frozen import Freezer
from prj import app

freezer = Freezer(app)

if __name__ == '__main__':
    freezer.freeze()
    freezer.serve()
