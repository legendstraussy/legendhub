import fs from 'fs'
import dump from 'mysqldump'
import 'dotenv/config'

const FREQ = process.env.FREQ
const BASE_PATH = 'backups'
const MAX_BACKUPS = 3

const connection = {
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE
}

function getDateTimeString() {
  const today = new Date()
  const YYYY = today.getFullYear()
  const MM = String(today.getMonth() + 1).padStart(2, '0')
  const DD = String(today.getDate()).padStart(2, '0')
  const hh = String(today.getHours()).padStart(2, '0')
  const mm = String(today.getMinutes()).padStart(2, '0')
  const ss = String(today.getSeconds()).padStart(2, '0')
  const ms = String(today.getMilliseconds()).padStart(3, '0')

  return `${YYYY}${MM}${DD}T${hh}${mm}${ss}${ms}`
}

function save({ dumpToFile }) {
  if (!dumpToFile) return

  dump({
    connection,
    dumpToFile
  })
}

try {
  // current backup
  save({ dumpToFile: `/${BASE_PATH}/backup.sql` })

  if (FREQ !== 'current') {
    const DIR_PATH = `/${BASE_PATH}/${FREQ}`

    // check for FREQ directory
    if (!fs.existsSync(DIR_PATH)) fs.mkdirSync(DIR_PATH)

    // delete oldest backup, rolling backups MAX_BACKUPS
    fs.readdir(DIR_PATH, async (err, files) => {
      if (!files.length) return
      if (err) throw `unable to read ${FREQ} directory: ${err}`
      
      if (files.length === MAX_BACKUPS) {
        const [file] = files
        const filePath = `${DIR_PATH}/${file}`

        await fs.unlink(filePath, err => {
          if (err) throw `unable to delete oldest ${FREQ} backup: ${err}`
        })
      }
    })

    // recurring backup
    const fileName = getDateTimeString()
    save({ dumpToFile: `${DIR_PATH}/${fileName}.sql` })
  }
} catch (e) {
  console.log(`could not run mysqldump: ${e}`)
}