from flask import Blueprint, render_template, request, jsonify, redirect, url_for
from utilities.query.query import get_product_by_id

product = Blueprint(
    'product', __name__, static_folder='static', static_url_path='/product', template_folder='templates'
)


# Routes
@product.route('/product')
def index():
    product_id = request.args.get('id')
    msg = request.args.get('msg')

    if product_id:
        item = get_product_by_id(product_id)
        return render_template('product.html', product=item, msg=msg)
    return redirect(url_for('catalog.index'))
