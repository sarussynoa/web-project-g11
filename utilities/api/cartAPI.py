from flask import jsonify, request, session, redirect, url_for
from . import api
from utilities.query.query import (
    get_client_product, delete_client_product,
    create_client_product, update_client_product,
    get_client_products, create_order, delete_client_products,
    create_order_product, get_product_price, get_client_products_with_product
)


# Given itemId & userId & amount, create/updates a row on 'cart' table. if amount=0, deletes it
# POST http://localhost:5000/api/cart?itemId=4&amount=1
@api.route('/cart/<item_id>', methods=['POST'])
def add_edit_product_on_cart(item_id):
    if 'userId' in session:
        user_id = session['userId']
        amount = request.form["amount"]
        # First, checks if the row already exists on table
        query_result = get_client_product(user_id, item_id)

        # if the amount is 0, the row should be deleted
        if amount == "0":
            delete_query_result = delete_client_product(user_id, item_id)
            print(jsonify({"status": "deleted", "result": delete_query_result}))
            return redirect(url_for('cart.index'))
        # If it exists, the row needs to be updated
        if len(query_result) != 0:
            updated_query_result = update_client_product(amount, user_id, item_id)
            print(jsonify({"status": "updated", "result": updated_query_result}))
            return redirect(url_for('product.index', id=item_id, msg="המוצר התעדכן בהצלחה בסל הקניות"))
        # If it not exists, the row needs to be created
        create_query_result = create_client_product(user_id, item_id, amount)
        print(jsonify({"status": "created", "result": create_query_result}))
        return redirect(url_for('product.index', id=item_id, msg="המוצר נוסף בהצלחה לסל הקניות" ))

    return redirect(url_for('error.index', message="שגיאה: משתמש לא מחובר, לא ניתן להוסיף פריטים לעגלת הקניות"))


@api.route('/cart', methods=['GET'])
def get_cart_items():
    if 'userId' in session:
        user_id = session['userId']
        return get_client_products_with_product(user_id)
    return redirect(url_for('error.index', message="שגיאה: משתמש לא מחובר, לא ניתן לצפות בעגלה"))


# Removes the items from the 'cart' table, create a new row on the 'orders' table
@api.route('/purchaseOrder', methods=['POST'])
def purchase_order():
    if 'userId' in session:
        user_id = session['userId']
        city = request.form["city"]
        street = request.form["street"]
        house_number = request.form["houseNumber"]
        special_requests = request.form["specialRequests"]

        data = get_client_products(user_id)
        total_cost = 0

        # Gets total price of all product items
        for item in data:
            res = get_product_price(item.get('productId'))
            total_cost = total_cost + (res[0].price * item.get('amount'))

        # Deletes cart
        delete_client_products(user_id)

        # Purchase the order
        order_request_id = create_order(user_id, total_cost, city, street, house_number, special_requests)

        if order_request_id:
            for item in data:
                create_order_product(item.get('productId'), order_request_id, item.get('amount'))
        return redirect(url_for('user.index', ))
    return jsonify({"status": "error", "result": "שגיאה: משתמש לא מחובר, לא ניתן לבצע הזמנה"})
