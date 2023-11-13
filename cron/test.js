import mysql from 'mysql2'
import dump from 'mysqldump'
import 'dotenv/config'

const myDump = dump({
  connection: {
    host: process.env.MYSQL_HOST || 'localhost',
    user: process.env.MYSQL_USER || 'root',
    password: process.env.MYSQL_PASSWORD || 'root',
    database: process.env.MYSQL_DATABASE || 'hub'
  },
  dumpToFile: './dump.sql'
})

const database = mysql.createConnection({
  host: process.env.MYSQL_HOST || 'localhost',
  user: process.env.MYSQL_USER || 'root',
  password: process.env.MYSQL_PASSWORD || 'root',
  database: process.env.MYSQL_DATABASE || 'hub',
  port: process.env.MYSQL_PORT || 3306    
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