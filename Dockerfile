#Choisir une image de base Python légère
FROM python:3.13-slim

#Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Installer les dépendances Flask
# Copier d'abord le fichier requirements.txt
COPY requirements.txt .
# Installer toutes les dépendances listées dedans
RUN pip install --no-cache-dir -r requirements.txt

# 4️⃣ Copier le code de l'application dans le conteneur
COPY . .
# 5️⃣ Spécifier le port sur lequel Flask écoute
EXPOSE 8000

# 6️⃣ Définir les variables d'environnement Flask pour que le serveur écoute sur toutes les interfaces
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8000

# 7️⃣ Lancer l'application Flask
CMD ["flask", "run"]
