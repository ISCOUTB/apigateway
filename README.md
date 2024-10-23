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
