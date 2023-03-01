migrate((db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("xowo5utxo8qqok8");

  return dao.deleteCollection(collection);
}, (db) => {
  const collection = new Collection({
    "id": "xowo5utxo8qqok8",
    "created": "2023-03-01 09:37:34.024Z",
    "updated": "2023-03-01 09:42:13.834Z",
    "name": "games",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "txmziaix",
        "name": "name",
        "type": "text",
        "required": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "khe3sxgj",
        "name": "description",
        "type": "text",
        "required": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      }
    ],
    "listRule": "",
    "viewRule": "",
    "createRule": "",
    "updateRule": "",
    "deleteRule": "",
    "options": {}
  });

  return Dao(db).saveCollection(collection);
})
