@react.component
let make = (~name: option<string>=?) => {
  let greeting = switch name {
  | Some(name) => "Hello " ++ name ++ "!"
  | None => "Hello stranger!"
  }
  <div> {React.string(greeting)} </div>
}
