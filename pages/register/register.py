from flask import Blueprint, render_template

# about blueprint definition
register = Blueprint(
    'register',
    __name__,
    static_folder='static',
    static_url_path='/register',
    template_folder='templates'
)


# Routes
@register.route('/register')
def index():
    return render_template('register.html')
