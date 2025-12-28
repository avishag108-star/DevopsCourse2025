FROM python:3.9-slim

WORKDIR /app

# העתקת כל הקבצים לתוך הקונטיינר
COPY . .

# התקנת הספריות מקובץ הדרישות
RUN pip install --no-cache-dir -r requirements.txt

# התקנת האפליקציה עצמה (בגלל שיש setup.py)
RUN pip install -e .

# הגדרת משתני סביבה כדי שפלאסק ידע מה להריץ
ENV FLASK_APP=flaskr
ENV FLASK_ENV=development

# חשיפת הפורט
EXPOSE 5000

# הפקודה להרצת השרת
CMD ["flask", "run", "--host=0.0.0.0"]
