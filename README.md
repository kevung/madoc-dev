[![Build Status](http://192.168.0.21:3001/api/badges/kevin/madoc-dev/status.svg)](http://192.168.0.21:3001/kevin/madoc-dev)

# Mkdocs préconfigurée

## Résumé

Ce dépot contient une documentation Mkdocs vierge préconfigurée (thème, latex, footnote...)

## Pré-requis

- python (3.3+)
- [pip](https://pypi.org/)

## Installation

```
pip install -r requirements.txt
```

## Visualisation de la doc

```
python -m mkdocs serve
```

La documentation sera visible dans un navigateur à l'adresse
[http://127.0.0.1:8000](http://127.0.0.1:8000)

## fichier `NAME.md`

Pour l'intégration continue qui peut se charger d'exporter madoc au format `docx`, `pdf`... Indiquez dans `NAME.md` le nom que vous souhaitez pour vos fichiers contruits.
