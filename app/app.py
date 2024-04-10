import re
from collections import Counter
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/process', methods=['POST'])
def process():
    text = request.form['text']

    # Count the occurrences of each word
    words_list = Counter(re.findall(r'\b\w+\b', text.lower()))

    # Sort the words by frequency
    word_counts_list = sorted(words_list.items(), key=lambda x: x[1], reverse=True)

    # Print the word counts
    result = '\n'.join([f"{word}: {count}" for word, count in word_counts_list])

    return result

if __name__ == '__main__':
    app.run(debug=True)
