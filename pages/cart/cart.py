from flask import Blueprint, render_template, session, jsonify
from utilities.query.query import get_client_products_with_product

# about blueprint definition
cart = Blueprint(
    'cart',
    __name__,
    static_folder='static',
    static_url_path='/cart',
    template_folder='templates'
)


# Routes
@cart.route('/cart')
def index():
    if 'userId' in session:
        items = get_client_products_with_product(session['userId'])
        return render_template('cart.html', items=items, error=False)
    return render_template('cart.html', items=[], error="אנא התחבר למערכת בכדי לצפות בעגלת הקניות")
