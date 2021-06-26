from flask import Flask

# App setup
app = Flask(__name__)
app.config.from_pyfile('settings.py')

app.config['JSON_AS_ASCII'] = False

# --- REST API
from utilities.api import api
app.register_blueprint(api)

# --- Pages
# Homepage
from pages.homepage.homepage import homepage
app.register_blueprint(homepage)

# About
from pages.about.about import about
app.register_blueprint(about)

# Catalog
from pages.catalog.catalog import catalog
app.register_blueprint(catalog)

# Product
from pages.product.product import product
app.register_blueprint(product)

# Cart
from pages.category.category import category
app.register_blueprint(category)

# Register
from pages.register.register import register
app.register_blueprint(register)

# Cart
from pages.cart.cart import cart
app.register_blueprint(cart)

# Order
from pages.order.order import order
app.register_blueprint(order)

# User
from pages.user.user import user
app.register_blueprint(user)

# Page error handlers
from pages.page_error_handlers.page_error_handlers import page_error_handlers
app.register_blueprint(page_error_handlers)

# Error page for rendering messages
from pages.error.error import error
app.register_blueprint(error)


# --- Components
# Main menu
from components.main_menu.main_menu import main_menu
app.register_blueprint(main_menu)

# Footer
from components.footer.footer import footer
app.register_blueprint(footer)
