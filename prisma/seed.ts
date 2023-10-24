const { PrismaClient } = require('./generated/client');
const { PrismaClient: OldHubClient } = require('./generated/client-oldhub');

const hub = new PrismaClient()
const oldhub = new OldHubClient()

async function main() {
  // console.log(`Start seeding...`)
  const items = await oldhub.items.findMany()
  const item = items[1200]
  await hub.item.create({
    data: {
      shortDescription: 'Test Item',
      createdBy: 1
    }
  })
  // for (const u of userData) {
  //   const user = await prisma.user.create({
  //     data: u,
  //   })
  //   console.log(`Created user with id: ${user.id}`)
  // }
  // console.log(`Seeding finished.`)
}

main()
  .then(async () => {
    await hub.$disconnect()
    await oldhub.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await hub.$disconnect()
    await oldhub.$disconnect()
    process.exit(1)
  })