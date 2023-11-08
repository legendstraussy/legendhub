import mysql from 'mysql2'
import 'dotenv/config'

const database = mysql.createConnection({
  host: process.env.MYSQL_HOST || 'localhost',
  user: process.env.MYSQL_USER || 'root',
  password: process.env.MYSQL_PASSWORD || 'root',
  database: process.env.MYSQL_DATABASE || 'hub',
  port: process.env.MYSQL_PORT || 3306    
})

database.connect()

const sqlQuery = 'SELECT * FROM accounts'

database.query(sqlQuery, (err, result) => {
  if (err) throw err;

  console.log('ACCOUNTS: ', JSON.stringify(result))
  database.destroy()
})

console.log('bingo from JavaScript!')