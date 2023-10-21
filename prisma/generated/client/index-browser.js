
Object.defineProperty(exports, "__esModule", { value: true });

const {
  Decimal,
  objectEnumValues,
  makeStrictEnum,
  Public,
  detectRuntime,
} = require('./runtime/index-browser')


const Prisma = {}

exports.Prisma = Prisma
exports.$Enums = {}

/**
 * Prisma Client JS version: 5.4.2
 * Query Engine version: ac9d7041ed77bcc8a8dbd2ab6616b39013829574
 */
Prisma.prismaVersion = {
  client: "5.4.2",
  engine: "ac9d7041ed77bcc8a8dbd2ab6616b39013829574"
}

Prisma.PrismaClientKnownRequestError = () => {
  throw new Error(`PrismaClientKnownRequestError is unable to be run ${runtimeDescription}.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)};
Prisma.PrismaClientUnknownRequestError = () => {
  throw new Error(`PrismaClientUnknownRequestError is unable to be run ${runtimeDescription}.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.PrismaClientRustPanicError = () => {
  throw new Error(`PrismaClientRustPanicError is unable to be run ${runtimeDescription}.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.PrismaClientInitializationError = () => {
  throw new Error(`PrismaClientInitializationError is unable to be run ${runtimeDescription}.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.PrismaClientValidationError = () => {
  throw new Error(`PrismaClientValidationError is unable to be run ${runtimeDescription}.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.NotFoundError = () => {
  throw new Error(`NotFoundError is unable to be run ${runtimeDescription}.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.Decimal = Decimal

/**
 * Re-export of sql-template-tag
 */
Prisma.sql = () => {
  throw new Error(`sqltag is unable to be run ${runtimeDescription}.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.empty = () => {
  throw new Error(`empty is unable to be run ${runtimeDescription}.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.join = () => {
  throw new Error(`join is unable to be run ${runtimeDescription}.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.raw = () => {
  throw new Error(`raw is unable to be run ${runtimeDescription}.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.validator = Public.validator

/**
* Extensions
*/
Prisma.getExtensionContext = () => {
  throw new Error(`Extensions.getExtensionContext is unable to be run ${runtimeDescription}.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}
Prisma.defineExtension = () => {
  throw new Error(`Extensions.defineExtension is unable to be run ${runtimeDescription}.
In case this error is unexpected for you, please report it in https://github.com/prisma/prisma/issues`,
)}

/**
 * Shorthand utilities for JSON filtering
 */
Prisma.DbNull = objectEnumValues.instances.DbNull
Prisma.JsonNull = objectEnumValues.instances.JsonNull
Prisma.AnyNull = objectEnumValues.instances.AnyNull

Prisma.NullTypes = {
  DbNull: objectEnumValues.classes.DbNull,
  JsonNull: objectEnumValues.classes.JsonNull,
  AnyNull: objectEnumValues.classes.AnyNull
}

/**
 * Enums
 */

exports.Prisma.TransactionIsolationLevel = makeStrictEnum({
  ReadUncommitted: 'ReadUncommitted',
  ReadCommitted: 'ReadCommitted',
  RepeatableRead: 'RepeatableRead',
  Serializable: 'Serializable'
});

exports.Prisma.AccountScalarFieldEnum = {
  id: 'id',
  mudId: 'mudId',
  createdDate: 'createdDate',
  modifiedDate: 'modifiedDate',
  firstName: 'firstName',
  lastName: 'lastName',
  email: 'email',
  preferences: 'preferences'
};

exports.Prisma.AccountRoleScalarFieldEnum = {
  id: 'id',
  accountId: 'accountId',
  role: 'role'
};

exports.Prisma.AccountNotificationScalarFieldEnum = {
  id: 'id',
  accountId: 'accountId',
  notificationId: 'notificationId',
  read: 'read',
  readDate: 'readDate'
};

exports.Prisma.AccountPasswordScalarFieldEnum = {
  id: 'id',
  accountId: 'accountId',
  passwordHash: 'passwordHash'
};

exports.Prisma.NetworkHistoryScalarFieldEnum = {
  id: 'id',
  accountId: 'accountId',
  createdDate: 'createdDate',
  loginDate: 'loginDate',
  ipAddress: 'ipAddress'
};

exports.Prisma.NetworkBlacklistScalarFieldEnum = {
  id: 'id',
  networkHistoryId: 'networkHistoryId',
  issueDate: 'issueDate',
  termDate: 'termDate',
  issuer: 'issuer'
};

exports.Prisma.NotificationScalarFieldEnum = {
  id: 'id',
  createdDate: 'createdDate',
  createdBy: 'createdBy',
  type: 'type',
  title: 'title',
  description: 'description',
  content: 'content'
};

exports.Prisma.CharacterScalarFieldEnum = {
  id: 'id',
  mudId: 'mudId',
  accountId: 'accountId',
  createdDate: 'createdDate',
  modifiedDate: 'modifiedDate',
  name: 'name',
  description: 'description',
  level: 'level'
};

exports.Prisma.CharacterVersionScalarFieldEnum = {
  id: 'id',
  characterId: 'characterId',
  equipmentId: 'equipmentId',
  statsId: 'statsId',
  createdDate: 'createdDate',
  modifiedDate: 'modifiedDate',
  version: 'version',
  hometown: 'hometown',
  characterEquipmentId: 'characterEquipmentId'
};

exports.Prisma.CharacterStatScalarFieldEnum = {
  id: 'id',
  characterVersionId: 'characterVersionId',
  str: 'str',
  min: 'min',
  dex: 'dex',
  con: 'con',
  per: 'per',
  spi: 'spi',
  strSwap: 'strSwap',
  minSwap: 'minSwap',
  dexSwap: 'dexSwap',
  conSwap: 'conSwap',
  perSwap: 'perSwap',
  spiSwap: 'spiSwap'
};

exports.Prisma.CharacterQuestScalarFieldEnum = {
  id: 'id',
  characterVersionId: 'characterVersionId',
  questId: 'questId'
};

exports.Prisma.CharacterEquipmentScalarFieldEnum = {
  id: 'id',
  light: 'light',
  finger1: 'finger1',
  finger2: 'finger2',
  neck1: 'neck1',
  neck2: 'neck2',
  body: 'body',
  head: 'head',
  hands: 'hands',
  feet: 'feet',
  face: 'face',
  arms: 'arms',
  legs: 'legs',
  about: 'about',
  waist: 'waist',
  wrist1: 'wrist1',
  wrist2: 'wrist2',
  wield: 'wield',
  hold1: 'hold1',
  hold2: 'hold2',
  hold3: 'hold3',
  ear1: 'ear1',
  ear2: 'ear2',
  arm: 'arm',
  amulet: 'amulet',
  aux: 'aux',
  itemId: 'itemId'
};

exports.Prisma.ItemScalarFieldEnum = {
  id: 'id',
  createdDate: 'createdDate',
  createdBy: 'createdBy',
  modifiedDate: 'modifiedDate',
  modifiedBy: 'modifiedBy',
  shortDescription: 'shortDescription',
  longDescription: 'longDescription',
  timer: 'timer',
  align: 'align',
  rent: 'rent',
  preservable: 'preservable',
  netStat: 'netStat',
  notes: 'notes',
  weight: 'weight',
  slots: 'slots',
  isBonded: 'isBonded',
  isCastable: 'isCastable',
  isHeroic: 'isHeroic',
  isLevelRequired: 'isLevelRequired',
  isLight: 'isLight',
  isLimited: 'isLimited',
  isSoulbound: 'isSoulbound',
  isUnique: 'isUnique'
};

exports.Prisma.ItemWeaponScalarFieldEnum = {
  id: 'id',
  itemId: 'itemId',
  quality: 'quality',
  speed: 'speed',
  isHoldable: 'isHoldable',
  isTwoHanded: 'isTwoHanded',
  ammoCapacity: 'ammoCapacity',
  ammoTypeId: 'ammoTypeId',
  shotAccuracy: 'shotAccuracy',
  maxDamage: 'maxDamage',
  minDamage: 'minDamage',
  avgDamage: 'avgDamage',
  stat: 'stat',
  type: 'type'
};

exports.Prisma.ItemSpellScalarFieldEnum = {
  id: 'id',
  itemId: 'itemId',
  spellId: 'spellId'
};

exports.Prisma.SpellScalarFieldEnum = {
  id: 'id',
  createdDate: 'createdDate',
  createdBy: 'createdBy',
  modifiedDate: 'modifiedDate',
  modifiedBy: 'modifiedBy',
  name: 'name',
  description: 'description',
  notes: 'notes',
  words: 'words',
  levelRequirement: 'levelRequirement'
};

exports.Prisma.PotionScalarFieldEnum = {
  id: 'id',
  createdDate: 'createdDate',
  createdBy: 'createdBy',
  modifiedDate: 'modifiedDate',
  modifiedBy: 'modifiedBy',
  name: 'name',
  description: 'description',
  notes: 'notes',
  duration: 'duration'
};

exports.Prisma.SkillScalarFieldEnum = {
  id: 'id',
  createdDate: 'createdDate',
  createdBy: 'createdBy',
  modifiedDate: 'modifiedDate',
  modifiedBy: 'modifiedBy',
  name: 'name',
  description: 'description',
  notes: 'notes',
  trainable: 'trainable',
  levelRequirement: 'levelRequirement'
};

exports.Prisma.AbilityScalarFieldEnum = {
  id: 'id',
  createdDate: 'createdDate',
  createdBy: 'createdBy',
  modifiedDate: 'modifiedDate',
  modifiedBy: 'modifiedBy',
  name: 'name',
  description: 'description',
  notes: 'notes',
  firstRankPoints: 'firstRankPoints',
  secondRankPoints: 'secondRankPoints',
  thirdRankPoints: 'thirdRankPoints',
  fourthRankPoints: 'fourthRankPoints',
  fifthRankPoints: 'fifthRankPoints',
  sixthRankPoints: 'sixthRankPoints'
};

exports.Prisma.QuestScalarFieldEnum = {
  id: 'id',
  createdDate: 'createdDate',
  createdBy: 'createdBy',
  modifiedDate: 'modifiedDate',
  modifiedBy: 'modifiedBy',
  name: 'name',
  description: 'description',
  notes: 'notes',
  whoises: 'whoises',
  pretitles: 'pretitles',
  post_titles: 'post_titles',
  experience: 'experience'
};

exports.Prisma.StatModiferScalarFieldEnum = {
  id: 'id',
  type: 'type',
  sourceId: 'sourceId',
  hp: 'hp',
  mv: 'mv',
  ma: 'ma',
  ac: 'ac',
  str: 'str',
  min: 'min',
  dex: 'dex',
  con: 'con',
  per: 'per',
  spi: 'spi',
  hpRegen: 'hpRegen',
  mvRegen: 'mvRegen',
  maRegen: 'maRegen',
  damroll: 'damroll',
  hitroll: 'hitroll',
  mitigation: 'mitigation',
  spellDam: 'spellDam',
  spellCrit: 'spellCrit',
  spellRedux: 'spellRedux',
  concentration: 'concentration',
  shotAccuracy: 'shotAccuracy',
  bonusAccuracy: 'bonusAccuracy',
  ammoCapacity: 'ammoCapacity',
  parry: 'parry',
  strCap: 'strCap',
  minCap: 'minCap',
  dexCap: 'dexCap',
  conCap: 'conCap',
  perCap: 'perCap',
  spiCap: 'spiCap'
};

exports.Prisma.ArticleScalarFieldEnum = {
  id: 'id',
  createdDate: 'createdDate',
  authorId: 'authorId',
  isProtected: 'isProtected'
};

exports.Prisma.ArticleVersionScalarFieldEnum = {
  id: 'id',
  articleId: 'articleId',
  modifiedDate: 'modifiedDate',
  editorId: 'editorId',
  content: 'content',
  isCurrent: 'isCurrent',
  version: 'version'
};

exports.Prisma.TagScalarFieldEnum = {
  id: 'id',
  createdDate: 'createdDate',
  createdBy: 'createdBy',
  tag: 'tag'
};

exports.Prisma.AppliedTagScalarFieldEnum = {
  id: 'id',
  typeId: 'typeId',
  sourceId: 'sourceId',
  tagId: 'tagId'
};

exports.Prisma.MobScalarFieldEnum = {
  id: 'id',
  mudId: 'mudId',
  areaId: 'areaId',
  shortDescription: 'shortDescription',
  longDescription: 'longDescription',
  level: 'level',
  isAggressive: 'isAggressive',
  experience: 'experience',
  gold: 'gold'
};

exports.Prisma.AreaScalarFieldEnum = {
  id: 'id',
  mudId: 'mudId',
  name: 'name',
  authorId: 'authorId',
  releaseDate: 'releaseDate'
};

exports.Prisma.ChangeLogScalarFieldEnum = {
  id: 'id',
  createdDate: 'createdDate',
  createdBy: 'createdBy',
  content: 'content',
  version: 'version',
  releaseDate: 'releaseDate'
};

exports.Prisma.SortOrder = {
  asc: 'asc',
  desc: 'desc'
};

exports.Prisma.NullableJsonNullValueInput = {
  DbNull: Prisma.DbNull,
  JsonNull: Prisma.JsonNull
};

exports.Prisma.JsonNullValueFilter = {
  DbNull: Prisma.DbNull,
  JsonNull: Prisma.JsonNull,
  AnyNull: Prisma.AnyNull
};

exports.Prisma.NullsOrder = {
  first: 'first',
  last: 'last'
};
exports.Role = exports.$Enums.Role = {
  PLAYER: 'PLAYER',
  EXPLORER: 'EXPLORER',
  SCRIBE: 'SCRIBE',
  ADMIN: 'ADMIN',
  DEV: 'DEV'
};

exports.NotificationType = exports.$Enums.NotificationType = {
  NEW_ITEM: 'NEW_ITEM',
  NEW_QUEST: 'NEW_QUEST',
  NEW_MOB: 'NEW_MOB',
  NEW_ARTICLE: 'NEW_ARTICLE',
  EDIT_ITEM: 'EDIT_ITEM',
  EDIT_QUEST: 'EDIT_QUEST',
  EDIT_MOB: 'EDIT_MOB',
  EDIT_ARTICLE: 'EDIT_ARTICLE',
  SYSTEM: 'SYSTEM'
};

exports.Align = exports.$Enums.Align = {
  GNE: 'GNE',
  GN: 'GN',
  GE: 'GE',
  NE: 'NE',
  G: 'G',
  N: 'N',
  E: 'E'
};

exports.WeaponStat = exports.$Enums.WeaponStat = {
  STR: 'STR',
  DEX: 'DEX',
  CON: 'CON'
};

exports.WeaponType = exports.$Enums.WeaponType = {
  BLUNT: 'BLUNT',
  PIERCE: 'PIERCE',
  SLASH: 'SLASH'
};

exports.StatModifierType = exports.$Enums.StatModifierType = {
  ABILITITY: 'ABILITITY',
  ITEM: 'ITEM',
  POTION: 'POTION',
  QUEST: 'QUEST',
  SKILL: 'SKILL',
  SPELL: 'SPELL'
};

exports.TagType = exports.$Enums.TagType = {
  ARTICLE: 'ARTICLE',
  ITEM: 'ITEM',
  MOB: 'MOB',
  QUEST: 'QUEST'
};

exports.Prisma.ModelName = {
  Account: 'Account',
  AccountRole: 'AccountRole',
  AccountNotification: 'AccountNotification',
  AccountPassword: 'AccountPassword',
  NetworkHistory: 'NetworkHistory',
  NetworkBlacklist: 'NetworkBlacklist',
  Notification: 'Notification',
  Character: 'Character',
  CharacterVersion: 'CharacterVersion',
  CharacterStat: 'CharacterStat',
  CharacterQuest: 'CharacterQuest',
  CharacterEquipment: 'CharacterEquipment',
  Item: 'Item',
  ItemWeapon: 'ItemWeapon',
  ItemSpell: 'ItemSpell',
  Spell: 'Spell',
  Potion: 'Potion',
  Skill: 'Skill',
  Ability: 'Ability',
  Quest: 'Quest',
  StatModifer: 'StatModifer',
  Article: 'Article',
  ArticleVersion: 'ArticleVersion',
  Tag: 'Tag',
  AppliedTag: 'AppliedTag',
  Mob: 'Mob',
  Area: 'Area',
  ChangeLog: 'ChangeLog'
};

/**
 * This is a stub Prisma Client that will error at runtime if called.
 */
class PrismaClient {
  constructor() {
    return new Proxy(this, {
      get(target, prop) {
        const runtime = detectRuntime()
        const edgeRuntimeName = {
          'workerd': 'Cloudflare Workers',
          'deno': 'Deno and Deno Deploy',
          'netlify': 'Netlify Edge Functions',
          'edge-light': 'Vercel Edge Functions',
        }[runtime]

        let message = 'PrismaClient is unable to run in '
        if (edgeRuntimeName !== undefined) {
          message += edgeRuntimeName + '. As an alternative, try Accelerate: https://pris.ly/d/accelerate.'
        } else {
          message += 'this browser environment, or has been bundled for the browser (running in `' + runtime + '`).'
        }
        
        message += `
If this is unexpected, please open an issue: https://github.com/prisma/prisma/issues`

        throw new Error(message)
      }
    })
  }
}

exports.PrismaClient = PrismaClient

Object.assign(exports, Prisma)
