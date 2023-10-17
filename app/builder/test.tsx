'use client'

const Test = () => {

  const handleClick = () => {
    console.log('bingo click')
  }

  return (
    <div>
      <button onClick={() => console.log('bingo')}>click me</button>
    </div>
  )
}

export default Test