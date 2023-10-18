// module ThemeContext = {
//   type theme = Light | Dark
//   let context = React.createContext(Light)
//
//   module Provider = {
//     let make = React.Context.provider(context)
//   }
// }
//
// module CutomButton = {
//   @react.component
//   let make = (~theme) => {
//     let className = switch theme {
//     | ThemeContext.Light => "theme-light"
//     | Dark => "theme-dark"
//     }
//     <button className> {React.string("click me")} </button>
//   }
// }
//
// module ThemeButton = {
//   @react.component
//   let make = () => {
//     let theme = React.useContext(ThemeContext.context)
//     <CutomButton theme />
//   }
// }
//
// module Toolbar = {
//   @react.component
//   let make = () => {
//     <div>
//       <ThemeButton />
//     </div>
//   }
// }

// @react.component
// let make = () => {
//   <ThemeContext.Provider value=ThemeContext.Dark>
//     <Toolbar />
//   </ThemeContext.Provider>
// }

// @react.component
// let make = () => {
//   let (count, setCount) = React.useState(() => 0)
//
//   <div className="p-6">
//     <h1 className="text-3xl font-semibold"> {"What is this about?"->React.string} </h1>
//     <p>
//       {React.string("This is a simple template for a Vite project using ReScript & Tailwind CSS.")}
//     </p>
//     <h2 className="text-2xl font-semibold mt-5"> {React.string("Fast Refresh Test")} </h2>
//     <Button onClick={_ => setCount(count => count + 1)}>
//       {React.string(`count is ${count->Int.toString}`)}
//     </Button>
//     <p>
//       {React.string("Edit ")}
//       <code> {React.string("src/App.res")} </code>
//       {React.string(" and save to test Fast Refresh.")}
//     </p>
//   </div>
// }

let useRouter = () => RescriptReactRouter.useUrl()->Route.fromUrl
@react.component
let make = () => {
  let route = useRouter()

  switch route {
  | Some(Main) => <Counter />
  | Some(Todo) => <TodoApp />
  | Some(Greeting({slug})) => <Greetings name=slug />
  | None => <h1> {React.string("Not Found")} </h1>
  }
}
