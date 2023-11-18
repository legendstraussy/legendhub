import mysql from 'mysql2'
import dump from 'mysqldump'
import 'dotenv/config'

const myDump = dump({
  connection: {
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
  },
  dumpToFile: '/backups/dump.sql'
})

const database = mysql.createConnection({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
  port: process.env.MYSQL_PORT    
})

try {
  database.connect()

  const sqlQuery = 'SELECT * FROM accounts'

  database.query(sqlQuery, (err, result) => {
    if (err) return null

    console.log('ACCOUNTS: ', JSON.stringify(result))
    
    database.destroy()
  })
} catch {
  
}