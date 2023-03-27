from flask import Flask, render_template, request, url_for, flash
from werkzeug.utils import redirect
from flask_mysqldb import MySQL


app = Flask(__name__)
app.secret_key = 'many random bytes'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'droame'

mysql = MySQL(app)

@app.route('/')
def Index():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM customer")
    data = cur.fetchall()
    cur.close()
    return render_template('index.html', customer=data)

# To insert a customer data

@app.route('/insert', methods = ['POST'])
def insert():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        customer_name = request.form['customer_name']
        customer_email = request.form['customer_email']
        customer_gender = request.form['customer_gender']
        customer_mo = request.form['customer_mo']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO customer (customer_name, customer_email,customer_gender, customer_mo) VALUES (%s, %s,%s, %s)", (customer_name, customer_email,customer_gender, customer_mo))
        mysql.connection.commit()
        return redirect(url_for('Index'))

#To delete a customer data

@app.route('/delete/<string:customer_id>', methods = ['GET'])
def delete(customer_id):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM customer WHERE customer_id=%s", (customer_id,))
    mysql.connection.commit()
    return redirect(url_for('Index'))

#To update a customer data

@app.route('/update', methods= ['POST', 'GET'])
def update():
    if request.method == 'POST':
        customer_id = request.form['customer_id']
        customer_name = request.form['customer_name']
        customer_email = request.form['customer_email']
        customer_gender = request.form['customer_gender']
        customer_mo = request.form['customer_mo']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE customer SET customer_name=%s, customer_email=%s, customer_gender=%s, customer_mo=%s WHERE customer_id=%s", (customer_name, customer_email, customer_gender, customer_mo, customer_id))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        return redirect(url_for('Index'))
    
#To booking

@app.route('/booking' , methods=['POST', 'GET'])
def booking():
    if request.method == "GET":
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM booking")
        data = cur.fetchall()
        cur.close()

        return render_template('booking.html', booking=data)

    if request.method == 'POST':
        flash("Data Booked Successfully")
        customer_name = request.form['customer_name']
        customer_email = request.form['customer_email']
        customer_mo = request.form['customer_mo']
        location_id = request.form['location_id']
        drone_shot_id = request.form['drone_shot_id']
        booking_date = request.form['booking_date']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO booking (customer_name, customer_email, customer_mo, location_id, drone_shot_id, booking_date) VALUES (%s, %s, %s, %s, %s, %s)", (customer_name, customer_email, customer_mo, location_id, drone_shot_id, booking_date))
        mysql.connection.commit()
        return redirect(url_for('booking'))
    
#To delete a booked data

@app.route('/book_delete/<string:booking_id>', methods = ['GET'])
def book_delete(booking_id):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM booking WHERE booking_id=%s", (booking_id,))
    mysql.connection.commit()
    return redirect(url_for('booking'))


#To update a booked data

@app.route('/book_update', methods= ['POST', 'GET'])
def book_update():
    if request.method == 'POST':
        booking_id = request.form['booking_id']
        customer_name = request.form['customer_name']
        customer_email = request.form['customer_email']
        customer_mo = request.form['customer_mo']
        location_id = request.form['location_id']
        drone_shot_id = request.form['drone_shot_id']
        booking_date = request.form['booking_date']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE booking SET customer_name=%s, customer_email=%s, customer_mo=%s, location_id=%s, drone_shot_id=%s, booking_date=%s  WHERE booking_id=%s", (customer_name, customer_email, customer_mo, location_id, drone_shot_id, booking_date, booking_id))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        return redirect(url_for('booking'))
    

if __name__ == "__main__":
    app.run(debug=True)