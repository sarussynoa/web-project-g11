from flask import Blueprint, render_template, session, jsonify
from utilities.db.db_manager import dbManager

# about blueprint definition
order = Blueprint(
    'order',
    __name__,
    static_folder='static',
    static_url_path='/order',
    template_folder='templates'
)


# Routes
@order.route('/order')
def index():
    if 'userId' in session:
        return render_template('order.html', error=False)
    return render_template('order.html', error="אנא התחבר למערכת בכדי לבצע הזמנה")
