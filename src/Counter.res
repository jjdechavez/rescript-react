module Document = {
  type t
  @val external document: t = "document"
  @set external setTitle: (t, string) => unit = "title"
}

@react.component
let make = () => {
  let (count, setCount) = React.useState(_ => 0)

  React.useEffect1(() => {
    open Document
    document->setTitle(`Your clicked ${Belt.Int.toString(count)} times!`)
    None
  }, [count])

  let onClick = _evt => {
    setCount(prev => prev + 1)
  }

  let msg = "You clicked " ++ Belt.Int.toString(count) ++ " times"

  <div>
    <p> {React.string(msg)} </p>
    <button onClick> {React.string("Click me")} </button>
  </div>
}
