from flask import Flask, render_template, request, redirect, url_for
import sqlite3
from datetime import datetime

app = Flask(__name__)

def init_db():
    conn = sqlite3.connect('messages.db')
    c = conn.cursor()
    c.execute('''CREATE TABLE IF NOT EXISTS messages
                 (id INTEGER PRIMARY KEY AUTOINCREMENT,
                  content TEXT NOT NULL,
                  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)''')
    conn.commit()
    conn.close()

@app.route('/')
def index():
    conn = sqlite3.connect('messages.db')
    c = conn.cursor()
    c.execute('SELECT * FROM messages ORDER BY created_at DESC')
    messages = c.fetchall()
    conn.close()
    return render_template('index.html', messages=messages)

@app.route('/add_message', methods=['POST'])
def add_message():
    content = request.form['content']
    if content:
        conn = sqlite3.connect('messages.db')
        c = conn.cursor()
        c.execute('INSERT INTO messages (content) VALUES (?)', (content,))
        conn.commit()
        conn.close()
    return redirect(url_for('index'))

@app.route('/about')
def about():
    return render_template('about.html')

if __name__ == '__main__':
    init_db()
    app.run(host='0.0.0.0', port=5000, debug=True)