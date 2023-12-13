export const AUTH_EXPIRATION_LOOP_CHECK_SECONDS = 1

export const ROUTES = {
  HOME: '/',
  LOGIN: '/login',
  REGISTER: '/register',
  BUILDER: '/builder',
  ITEMS: '/items',
  MOBS: '/mobs',
  QUESTS: '/quests',
  ARTICLES: '/articles',
  DASHBOARD: '/dashboard'
}

export const ERROR_MESSAGES = {
  ALREADY_EXISTS: 'this email has already been registered to an account',
  GENERIC_ERROR: 'there was an issue with registration',
  INVALID_LOGIN: 'invalid password or account email',
  ACCOUNT_RESET: 'if the account exists, an email will be sent with a link to reset your password',
  RESET_TOKEN_EXPIRED: 'your reset token has expired',
  RESET_TOKEN_INVALID: 'reset token is not valid'
}

export const SUCCESS_MESSAGES = {
  ACCOUNT_CREATED: 'the account has successfully been created',
  ACCOUNT_RESET: 'if the account exists, an email will be sent with a link to reset your password',
  PASSWORD_RESET: 'your password has successfully been reset'
}