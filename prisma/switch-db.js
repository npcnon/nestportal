const fs = require('fs');
const path = require('path');

const mysqlConfig = `datasource db {
  provider = "mysql"
  url      = env("DATABASE_URL")
}`;

const sqliteConfig = `datasource db {
  provider = "sqlite"
  url      = "file:./dev.db"
}`;

const schemaPath = path.join(__dirname, 'schema.prisma');

function switchToSqlite() {
  let schema = fs.readFileSync(schemaPath, 'utf8');
  schema = schema.replace(/datasource db {[\s\S]*?}/, sqliteConfig);
  fs.writeFileSync(schemaPath, schema);
  console.log('Switched to SQLite');
}

function switchToMysql() {
  let schema = fs.readFileSync(schemaPath, 'utf8');
  schema = schema.replace(/datasource db {[\s\S]*?}/, mysqlConfig);
  fs.writeFileSync(schemaPath, schema);
  console.log('Switched to MySQL');
}

if (process.argv[2] === 'sqlite') {
  switchToSqlite();
} else if (process.argv[2] === 'mysql') {
  switchToMysql();
} else {
  console.log('Usage: node switch-db.js [sqlite|mysql]');
}