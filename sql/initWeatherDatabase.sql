-- Script permettant la mise en place de la BDD  Météo
-- Auteurs: GERARD Christopher & ALBRECHT--MARTIN Danaé

-- Encodage des caractères
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- Créer la base
CREATE DATABASE IF NOT EXISTS weather CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE weather;

-- Supprimer les tables si elles existent (ordre inverse des dépendances)
DROP TABLE WeatherReport;
DROP TABLE Station;
DROP TABLE WindReport;
DROP TABLE WeatherCode;
DROP TABLE WindOrientation;
DROP TABLE Region;

-- Création des tables

CREATE TABLE Region (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    postal_code VARCHAR(10),
    id_regionFK INT NULL,
    FOREIGN KEY (id_regionFK) REFERENCES Region(id)
);

CREATE TABLE Station (
    id INT PRIMARY KEY,
    city VARCHAR(255),
    id_regionFK INT,
    FOREIGN KEY (id_regionFK) REFERENCES Region(id)
);

CREATE TABLE WindOrientation (
    id INT PRIMARY KEY,
    degree INT,
    acronym VARCHAR(10),
    name VARCHAR(255)
);

CREATE TABLE WindReport (
    id INT PRIMARY KEY,
    speed DECIMAL(5,2),
    id_wind_orientationFK INT,
    FOREIGN KEY (id_wind_orientationFK) REFERENCES WindOrientation(id)
);

CREATE TABLE WeatherCode (
    id INT PRIMARY KEY,
    description VARCHAR(255)
);

CREATE TABLE WeatherReport (
    id INT PRIMARY KEY,
    temperature DECIMAL(5,2),
    pressure DECIMAL(6,2),
    hygrometry DECIMAL(5,2),
    date_report DATETIME,
    id_stationFK INT,
    id_wind_reportFK INT,
    id_weather_codeFK INT,
    FOREIGN KEY (id_stationFK) REFERENCES Station(id),
    FOREIGN KEY (id_wind_reportFK) REFERENCES WindReport(id),
    FOREIGN KEY (id_weather_codeFK) REFERENCES WeatherCode(id)
);