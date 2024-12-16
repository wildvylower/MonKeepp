from flask import Flask, request, jsonify
from PIL import Image
import pytesseract
import re
import io

app = Flask(__name__)

pytesseract.pytesseract.tesseract_cmd = (r'C:/Program Files/Tesseract-OCR/tesseract.exe')

@app.route('/process-receipt', methods=['GET','POST'])
def process_receipt():
    if 'image' not in request.files:
        return jsonify({'error': 'No file uploaded'}), 400

    file = request.files['image']
    if file:
        image = Image.open(io.BytesIO(file.read()))

        # Proses OCR menggunakan Tesseract
        text = pytesseract.image_to_string(image)
        judul_struk = next((line.strip() for line in text.split('\n') if line.strip()), "")

        # Cari total
        total_int = 0
        total_str = ""
        for line in text.split('\n'):
            if 'TOTAL' in line.upper():
                match = re.search(r'(\d{1,6}(?:[.,]\d{3})*(?:[.,]\d{2})?)', line)
                if match:
                    total = match.group(1)
                    temp = int(total.replace(",","").replace(".",""))
                    if temp > total_int:
                        total_int = temp
                        total_str = total

        return jsonify({
            'judul_struk': judul_struk,
            'text': text,
            'total': total_str,
            'int' : total_int
        })

    return jsonify({'error': 'Invalid file'}), 400


# Run the app if this file executed
if __name__ == '__main__':
    app.run(debug=True, port=8000)