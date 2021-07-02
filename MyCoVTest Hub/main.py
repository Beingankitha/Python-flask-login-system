# rendering contact.html template and making JSON response
from validate_email import validate_email
from flask import Flask, render_template, jsonify, request, url_for, make_response, sessions, logging, session,g, redirect, flash
from mailbox import Message
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker
from passlib.hash import sha256_crypt
import js2py
import mysql.connector
# using Flask-WTF CSRF protection for AJAX requests
from flask_wtf.csrf import CSRFProtect
from wtforms import Form, BooleanField, TextField, PasswordField, validators
import os

# initializing app
app = Flask(__name__)
app.secret_key=os.urandom(24)
# protecting our app 
#csrf = CSRFProtect(app)

cnx = mysql.connector.connect(host="localhost",user="Ankita", password="Anki1313", database="CO3102_CW2_2020", auth_plugin='mysql_native_password')
cursor=cnx.cursor()

@app.before_request
def before_request():
    if 'Username' in session:
        #g.username = select PasswordHash from Admin where Username = 'admin'
        return " "


@app.route('/')
def index():
    return render_template('Index.html')

@app.route('/home', methods=["GET","POST"])
def home():
    if 'Username' in session:
        return render_template('Home.html')
    else:
        return redirect('/')

@app.route('/login_validation', methods=["GET","POST"])
def login_validation():
    if request.method == "POST":
        session.pop('Username', None)
        user=request.form.get("login_username")
        password = str(request.form.get("login_password"))
        sql_query = """select PasswordHash from Admin where Username = %s"""
        cursor.execute(sql_query,(user,))
        arecord = cursor.fetchall()
        sql_query1 = """select * from TestKitUsers where Username = %s"""
        cursor.execute(sql_query1,(user,))
        urecord = cursor.fetchall()
        if (len(arecord)==0) and (len(urecord)==0):
            flash("Username is not registered", "danger")
            return render_template('Login.html')
        elif(len(arecord)==1) and (len(urecord)==0):
            if sha256_crypt.verify(password, arecord[0][0]):                
                session['Username'] = user
                flash("Admin Login Successful", "success")
                return render_template('Home.html')
            else:
                flash("Invalid password for this admin username", "danger")
                return render_template('Login.html')
        elif (len(arecord)==0) and (len(urecord)==1):
            if sha256_crypt.verify(password, urecord[0][0]):                
                session['Username'] = user
                flash("Login Successful", "success")
                return render_template('Login.html')
            else:
                flash("Invalid password for this username", "danger")
                return render_template('Login.html')
            
        else:
            flash("Something went wrong(Invalid Username or password)", "danger")
            return render_template('Login.html')
    

@app.route('/register', methods=["GET","POST"])
def register():    
    return  render_template('Register.html')

@app.route('/register_validation', methods=["GET","POST"])
def register_validation():
    if request.method == "POST":
        email = request.form.get("r-email")
        user =request.form.get("r-username")
        password = str(request.form.get("r-password"))
        cpassword = str(request.form.get("r-cpassword"))

        sql_query = """select * from TestkitUsers where Username = %s"""
        cursor.execute(sql_query,(user,))
        record = cursor.fetchall()
        if(len(record)==1):
           flash("Username already taken","danger")
           return render_template('Register.html')
        elif (password != cpassword):
            flash("Password and Confirm password Mismatch", "danger")
            return render_template('Register.html')
        if(password == cpassword):
            sql_query = """insert into TestKitUsers(Username, Email, PasswordHash) values (%s, %s, %s)"""
            val = (user, email, sha256_crypt.encrypt(password))
            cursor.execute(sql_query, val)
            cnx.commit()
            flash("User Successfully Registered", "success")
            return render_template('Register.html')
    return render_template('Register.html')
        
@app.route('/login')
def userlogin():
    return render_template('Login.html')

@app.route('/SubmitTest')
def SubmitTest():
    return render_template('SubmitTest.html')

@app.route('/submittest_validation', methods=["POST"])
def submittest_validation():
    if request.method == "POST":
        email = request.form.get("email")
        fname = request.form.get("fullname")
        age = request.form.get("age")
        gender = request.form.get("gender")
        postcode = request.form.get("postcode")
        add1 = str(request.form.get("first_line"))
        add2 = str(request.form.get("second_line"))
        add3 = str(request.form.get("third_line"))
        town = str(request.form.get("post_town"))
        fulladd = add1 + '' + add2 + '' + add3 + town
        TTN = request.form.get("ttn")
        Tresult = request.form.get("tresult")

        sql_query = """select * from HomeTestKit where TNN_Code = %s"""
        cursor.execute(sql_query,(TTN,))
        record = cursor.fetchall()
        if(len(record)==1):
            if(record[0][1]=="0"):
                sql_query = """UPDATE HomeTestKit SET used = %s where TNN_Code = %s"""
                val=('1', TTN)
                cursor.execute(sql_query, val)
                print(cursor.rowcount, "record(s) affected")
                if(cursor.rowcount==1):
                    sql_query1 = """insert into TestResult values (%s, %s, %s, %s, %s, %s, %s, %s)"""
                    cursor.execute(sql_query1, (email, fname, age, gender, fulladd, postcode, TTN, Tresult))
                    print(cursor.rowcount, "record(s) affected")
                    cnx.commit()
                    flash("Entered TTN is valid and Test result successfully stored", "success")
                    return render_template('SubmitTest.html')
                else:
                    flash("Something went wrong", "danger")
                    return render_template('SubmitTest.html')
            else:
                flash("Entered TTN already used", "danger")
                return render_template('SubmitTest.html')
        else:
            flash("Please enter valid TTN", "danger")
            return render_template('SubmitTest.html')

    return render_template('SubmitTest.html')

@app.route('/logout')
def logout():
    session.pop('Username')
    return redirect(url_for('/'))

if __name__ == "__main__":
    app.run(debug=True)





