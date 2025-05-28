# Base de données de relevés météo

## 🚀 **Introduction**

Ce projet utilise **Docker** pour déployer une base de données **MySQL** contenant des informations météorologiques : stations, relevés météo, vents, régions, etc. Ce guide explique comment démarrer le conteneur MySQL et interagir avec la base de données à l’aide de différents outils.

## 🛠️ **Prérequis**

- **Docker** installé sur votre machine
- **docker-compose** installé (si nécessaire)

---

## 🧑‍💻 **Lancer la base de données MySQL**

### 1. **Cloner le projet**

Si ce n’est pas déjà fait, clonez ce projet sur votre machine :

```bash
git clone https://github.com/votre-utilisateur/weather-database.git
cd weather-database
```

### 2. **Démarrer MySQL avec Docker**

Dans le dossier du projet, exécutez :

```bash
docker-compose up --build
```

Cela va :
- Lancer un conteneur Docker avec MySQL
- Créer la base de données `weather`
- Exécuter le script d’initialisation ([sql/initWeatherDatabase.sql](sql/initWeatherDatabase.sql))

Le conteneur sera disponible sur le port `3306` de votre machine locale.

---

## 🔑 **Se connecter à la base de données**

### 1. **Via le terminal Docker**

Exécutez cette commande pour accéder à MySQL dans le conteneur :

```bash
docker exec -it weather-mysql mysql -u weather_user -p
```

Mot de passe : `weather_password`

Sélectionnez la base de données :

```sql
USE weather;
```

Pour quitter le shell MySQL :

```sql
exit;
```

---

### 2. **Avec un outil graphique (MySQL Workbench, DBeaver, etc.)**

**Paramètres de connexion :**
- **Host** : `127.0.0.1`
- **Port** : `3306`
- **User** : `weather_user`
- **Password** : `weather_password`
- **Database** : `weather`

---

## ⚙️ **Dépannage**

- **Erreur de connexion MySQL** : Vérifiez que le conteneur MySQL est en cours d’exécution avec `docker ps`. Si besoin, relancez-le avec `docker-compose up`.
- **Problèmes de requêtes SQL** : Assurez-vous d’être connecté à la base `weather` avec `USE weather;`.

---

## 🧑‍💻 **Gestion des migrations et modifications de schéma**

Pour modifier le schéma ou ajouter des tables :
1. Modifiez le fichier [`sql/initWeatherDatabase.sql`](sql/initWeatherDatabase.sql).
2. Redémarrez le conteneur avec :

```bash
docker-compose down
docker-compose up --build
```

**Attention : toutes les données existantes seront perdues lors de cette opération.**

## 📄 [Rapport du projet](./report.md)