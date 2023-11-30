import { PrismaClient } from './generated/client'
// import { PrismaClient as OldHubClient } from './generated/client-oldhub'

const hub = new PrismaClient()
// const oldhub = new OldHubClient()

async function main() {
  // console.log(`Start seeding...`)
  // const items = await oldhub.items.findMany()
  // const item = items[1200]
  // await hub.item.create({
  //   data: {
  //     shortDescription: 'Test Item',
  //     createdBy: 1
  //   }
  // })
}

main()
  .then(async () => {
    await hub.$disconnect()
    // await oldhub.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await hub.$disconnect()
    // await oldhub.$disconnect()
    process.exit(1)
  })