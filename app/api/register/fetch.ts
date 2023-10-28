type Registrant = {
  email: string,
  password: string
}

export async function register({ email, password }: Registrant) {
  return await fetch('/api/register', {
    method: 'POST',
    body: JSON.stringify({ email, password }),
  }).then(response => Promise.resolve(response.json()))
}