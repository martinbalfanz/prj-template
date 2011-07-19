import site
site.addsitedir('/var/www/prj')
activate_this = '/var/www/prjenv/bin/activate_this.py'
execfile(activate_this, dict(__file__=activate_this))
from prj import app as application
