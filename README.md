# API Gateway

![API Gateway](https://img.shields.io/badge/API-Gateway-blue.svg)
![Docker](https://img.shields.io/badge/Docker-Enabled-blue.svg)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3.0-brightgreen.svg)

## Table of Contents

- [Descripción](#descripción)
- [Características](#características)
- [Tecnologías Utilizadas](#tecnologías-utilizadas)
- [Arquitectura](#arquitectura)
- [Instalación](#instalación)
  - [Requisitos Previos](#requisitos-previos)
  - [Clonar el Repositorio](#clonar-el-repositorio)
  - [Configuración de Docker Compose](#configuración-de-docker-compose)
- [Uso](#uso)
  - [Ejecutar el API Gateway](#ejecutar-el-api-gateway)
  - [Automatización con Cron](#automatización-con-cron)
- [Monitoreo y Reportes](#monitoreo-y-reportes)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Contribución](#contribución)
- [Licencia](#licencia)
- [Contacto](#contacto)

## Descripción

El **API Gateway** es un componente esencial en arquitecturas de microservicios que actúa como un punto de entrada único para todas las solicitudes de clientes hacia los diferentes servicios backend. Facilita la gestión, seguridad y escalabilidad de las comunicaciones entre clientes y servicios internos.

Este proyecto utiliza **Nginx** como base para implementar el API Gateway, ofreciendo funcionalidades como enrutamiento dinámico, balanceo de carga, autenticación y monitoreo de servicios.

## Características

- **Enrutamiento Dinámico**: Dirige las solicitudes a los servicios backend apropiados basado en las rutas definidas.
- **Balanceo de Carga**: Distribuye las solicitudes entrantes de manera equitativa entre múltiples instancias de servicios.
- **Autenticación y Autorización**: Implementa mecanismos de seguridad para validar y autorizar solicitudes.
- **Monitoreo y Reportes**: Genera reportes detallados del estado de los contenedores Docker y operaciones realizadas.
- **Estilo Profesional**: Reportes HTML estilizados con **Bootstrap 5** para una visualización clara y atractiva.
- **Automatización**: Scripts automatizados para mantener los servicios actualizados y operativos, ejecutados periódicamente mediante `cron`.

## Configuración de Puertos

A continuación se detalla la configuración de puertos para cada proyecto. Esta tabla es útil para conocer qué puertos están expuestos y utilizados por cada servicio.

| Proyecto               | Puerto API | Puerto Web | MySQL | Postgresql |
|------------------------|------------|------------|-------|------------|
| AG-AgricultureCompany  | 8004       | 8003       | 3300  | 7000       |
| AG-GestionHospitalaria | 8001       | 8002       | 3301  | 7001       |
| AG-Product-s-Tech      | 8009       | 2024       | 3302  | 7002       |
| AG-TalkHub             | 8005       | 3000       | 3303  | 7003       |
| AG-Analysis-ICFES      | 8000       | 6900       | 3304  | 7004       |
| AG-Nebula              | 8011       | 8015       | 3305  | 7005       |
| AG-StellarGather       | 8010-8012  | 8013       | 3306  | 7006       |
| AG-WeatherWhisper      | 8016       | 8017       | 3307  | 7007       |
| AH-CineManager         | 8018       | 9018       | 3308  | 7008       |
| AH-MAPRICE             | 8019       | 9019       | 3309  | 7009       |
| AH-MetroEvent          | 8020       | 9020       | 3310  | 7010       |
| AH-PETSADDOPT          | 8021       | 9021       | 3311  | 7011       |
| AH-ProManage           | 8022       | 9022       | 3312  | 7012       |
| AH-TaskManager         | 8023       | 9023       | 3313  | 7013       |
| AH-ToolCheck           | 8024       | 9024       | 3314  | 7014       |
| AH-YaperGoUTB          | 8025       | 9025       | 3315  | 7015       |


## Tecnologías Utilizadas

- **Nginx**: Servidor web utilizado como API Gateway.
- **Docker & Docker Compose**: Contenedores para facilitar la implementación y gestión de servicios.
- **Bootstrap 5**: Framework CSS para estilizar los reportes HTML.
- **Bash Scripting**: Scripts para automatizar operaciones de actualización y monitoreo.
- **Cron**: Programación de tareas para ejecutar scripts de manera periódica.

## Arquitectura

La arquitectura del API Gateway se basa en una configuración de múltiples contenedores Docker, donde cada contenedor representa un servicio diferente (por ejemplo, bases de datos, aplicaciones backend, frontend, etc.). **Nginx** actúa como el punto de entrada, gestionando las solicitudes y dirigiéndolas a los servicios correspondientes.

## Instalación

### Requisitos Previos

- **Sistema Operativo**: Linux (preferiblemente Ubuntu)
- **Docker**: Instalado y configurado.
- **Docker Compose**: Instalado.

### Clonar el Repositorio

```bash
git clone https://github.com/tu-usuario/api-gateway.git
cd api-gateway
