from flask import (
    jsonify, session, request, url_for, redirect,
)
from . import api
from utilities.query.query import (add_new_user, get_client_by_credentials)


# creates a new user on the 'user' table
# POST http://127.0.0.1:5000/api/user , { email, password, birthday, phone, fullName }
@api.route('/user', methods=['POST'])
def create_user():
    email = request.form["email"]
    full_name = request.form["fullName"]
    password = request.form["password"]
    birthday = request.form["birthday"]
    phone = request.form["phone"]

    new_user = add_new_user(email, password, birthday, phone, full_name)

    if new_user:
        session['userId'] = new_user
        session['email'] = email
        session['name'] = full_name
        return redirect(url_for('user.index'))
    return redirect(url_for(
        'error.index', message="לא הצלחנו ליצור משתמש. אנא נסו שנית וודאו שכל השדות נכונים ותקינים"
    ))


# gets an existing user from the session data
# GET http://127.0.0.1:5000/api/user
@api.route('/user', methods=['GET'])
def get_user():
    return jsonify({
        "userId": session["userId"],
        "email": session["email"],
        "name": session["name"]
    })


# login if credentials are true, otherwise redirects to the homepage.
@api.route('/login', methods=['POST'])
def login():
    email = request.form["email"]
    password = request.form["password"]
    query_result = get_client_by_credentials(email, password)

    if len(query_result) != 0:
        session['userId'] = query_result[0].id
        session['email'] = query_result[0].email
        session['name'] = query_result[0].fullName
        return redirect(url_for('user.index'))
    return redirect(url_for('error.index', message="אחד או יותר מהפרטים שהוזנו אינם תקינים. אנא נסו להתחבר מחדש."))


# logouts from a session
@api.route('/logout', methods=['GET'])
def logout():
    session.clear()
    return redirect(url_for('homepage.index'))
