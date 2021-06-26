from flask import Blueprint, render_template, request, jsonify
from utilities.query.query import get_products

category = Blueprint(
    'category', __name__, static_folder='static', static_url_path='/category', template_folder='templates'
)

categories = {
    'single': 'עוגיות',
    "box": "מארזים טעימים",
    "glutenFree": "עוגיות ללא גלוטן"
}

# Routes
@category.route('/category')
def index():
    query_category = request.args.get('category')
    data = get_products(query_category)
    return render_template('category.html', data=data, category=categories[query_category])
