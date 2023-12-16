import mysql from 'mysql2'
import 'dotenv/config'

const database = mysql.createConnection({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PWD,
  database: process.env.MYSQL_DATABASE,
  port: process.env.MYSQL_PORT
})

try {
  database.connect()

  const sqlQuery = 'SELECT * FROM network_blacklist WHERE term_date < NOW()'
  
  database.query(sqlQuery, (error, result) => {
    if (error) return console.log(`could not cleanup expired IP bans: ${error}`)
    
    for (const index in result) {
      const bannedRecord = result[index]
      const sqlDelete = `DELETE FROM network_blacklist WHERE id = ${bannedRecord?.id}`
      database.query(sqlDelete, (error, _) => {
        if (error) return console.log('could not delete expired IP ban', error)
      })
    }
    
    database.destroy()
  })
} catch (error) {
  console.log(`could not cleanup expired IP bans: ${error}`)
}