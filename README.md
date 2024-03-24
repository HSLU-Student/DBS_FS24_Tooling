# DBS_FS24_Tooling
## SQL

### Quick Setup

1. Change paths in table_data.csv to your local paths
2. Setup .env Example given in [.env.example](./sql/.env.example)
3. Enter directory
   ````
   cd sql
   ````
4. Execute in powershell:
   ````
   .\loadFiles.ps1
   ````
5. in powershell
   ````
   .\loadFiles.ps1 -AllActions
   ````

### Description
We offer two files to setup the environment

1. [loadFiles.ps1](./sql/loadFiles.ps1) which gets files from different sources, configured in [table_data.csv](./sql/table_data.csv) and saves them into the correct docker bind volume folder
2. [setupDatabase.ps1](./sql/setupDatabase.ps1) which handles starting the docker container, setting up the database and loading the table data into the db.

### setupDatabase.ps1
The scripts accepts the following paramters

| Parameter | Description |
|-------------|-----------|
| -AllActions | Initializes tables, loads data and adds table constraints |
| -InitTables | Initializes tables |
| -LoadData | Loads the tables with table data |
| -AddConstraints | Adds the table Constraints to the tables |

When no parameter is given, only the docker container is started.

