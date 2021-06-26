from flask import jsonify
from utilities.db.db_manager import dbManager


def add_new_user(email, password, birthday, phone, full_name):
    return dbManager.commit(
        'INSERT INTO clients (email, password, birthday, phone, fullName) VALUES (%s, %s, %s, %s, %s)',
        (email, password, birthday, phone, full_name)
    )


def get_client_by_credentials(email, password):
    return dbManager.fetch(
        'SELECT * FROM clients WHERE email=%s AND password=%s', (email, password,)
    )


def get_user_orders(user_id):
    query_result = dbManager.fetch('SELECT * FROM orders WHERE clientId = %s', (user_id,))
    return jsonify(list(map(lambda row: row._asdict(), query_result))).get_json()


def get_products(category=False):
    if category:
        query_result = dbManager.fetch('SELECT * FROM products WHERE category = %s', (category,))
    else:
        query_result = dbManager.fetch('SELECT * FROM products')
    return jsonify(list(map(lambda row: row._asdict(), query_result))).get_json()


def get_client_product(user_id, item_id):
    return dbManager.fetch(
        'SELECT * FROM client_products WHERE clientId=%s AND productId=%s',
        (user_id, item_id)
    )


def delete_client_product(user_id, item_id):
    return dbManager.commit(
        'DELETE FROM client_products WHERE clientId=%s AND productId=%s',
        (user_id, item_id)
    )


def create_client_product(user_id, item_id, amount):
    dbManager.commit(
        'INSERT INTO client_products (clientId, productId, amount) VALUES (%s, %s, %s)',
        (user_id, item_id, amount)
    )


def update_client_product(amount, user_id, item_id):
    return dbManager.commit(
        'UPDATE client_products SET amount=%s WHERE clientId=%s AND productId=%s',
        (amount, user_id, item_id)
    )


def get_client_products(user_id):
    query_result = dbManager.fetch(
        'SELECT * FROM client_products WHERE clientId=%s',
        (user_id,)
    )
    return list(map(lambda row: row._asdict(), query_result))


def get_client_products_with_product(user_id):
    query_result = dbManager.fetch(
        'SELECT clientId, productId, amount, name, price, image FROM client_products c JOIN products p on c.productId = p.id WHERE clientId=%s',
        (user_id,)
    )
    return jsonify(list(map(lambda row: row._asdict(), query_result))).get_json()


def delete_client_products(user_id):
    return dbManager.commit('DELETE FROM client_products WHERE clientId=%s', (user_id,))


def get_product_by_id(product_id):
    query_result = dbManager.fetch('SELECT * FROM products WHERE id = %s', (product_id,))
    data = list(map(lambda row: row._asdict(), query_result))
    return jsonify(data).get_json()[0]


def get_product_price(item_id):
    return dbManager.fetch('SELECT price FROM products WHERE id=%s', (item_id,))


def create_order(user_id, total_cost, city, street, house_number, special_requests):
    return dbManager.commit(
        'INSERT INTO orders (clientId, totalCost, city, street, houseNumber, specialRequests) VALUES (%s, %s, %s, %s, %s, %s)',
        (user_id, total_cost, city, street, house_number, special_requests)
    )


def create_order_product(product_id, order_id, amount):
    return dbManager.commit(
        'INSERT INTO products_orders (productId, orderId, amount) VALUES (%s, %s, %s)',
        (product_id, order_id, amount,)
    )

