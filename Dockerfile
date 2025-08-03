# 1. Gunakan base image Python yang ringan
FROM python:3.12-slim

# 2. Set environment variables
ENV PYTHONUNBUFFERED=1

# 3. Set direktori kerja di dalam container
WORKDIR /app

# 4. Salin file requirements dan instal dependensi
COPY requirements.txt .
RUN pip install -r requirements.txt

# 5. Salin semua kode proyek ke dalam container
COPY . .

# 6. Jalankan migrasi database saat container dibuat
# Perintah ini akan dijalankan oleh Kubernetes nanti
# RUN python manage.py migrate

# 7. Beri tahu container untuk listen di port 8000
EXPOSE 8000

# 8. Perintah untuk menjalankan aplikasi
# Gunakan 0.0.0.0 agar bisa diakses dari luar container
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]