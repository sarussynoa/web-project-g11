from flask import Blueprint, render_template, request, redirect, url_for
from utilities.query.query import get_user_orders
# user blueprint definition
error = Blueprint('error', __name__, static_folder='static', static_url_path='/error', template_folder='templates')


# Routes
@error.route('/error',)
def index():
    message = request.args.get('message')
    return render_template('error.html', message=message)
