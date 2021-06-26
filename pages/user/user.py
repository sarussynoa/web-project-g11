from flask import Blueprint, render_template, session, redirect, url_for, jsonify
from utilities.query.query import get_user_orders
# user blueprint definition
user = Blueprint('user', __name__, static_folder='static', static_url_path='/user', template_folder='templates')


# Routes
@user.route('/user', )
def index():
    if 'userId' in session:
        orders = get_user_orders(session['userId'])
        return render_template('user.html', orders=orders)
    return redirect(url_for('homepage.index'))
