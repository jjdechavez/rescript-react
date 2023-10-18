%%raw("import './index.css'")

module Header = {
  @react.component
  let make = () => {
    let slug = "Jerald"

    <header>
      <nav>
        <ul className="flex items-center gap-x-4">
          <li>
            <Router.Link route={Route.Main}> {React.string("Home")} </Router.Link>
          </li>
          <li>
            <Router.Link route={Route.Todo}> {React.string("Todos")} </Router.Link>
          </li>
          <li>
            <Router.Link route={Route.Greeting({slug: slug})}> {React.string("Greeting to Jerald")} </Router.Link>
          </li>
        </ul>
      </nav>
    </header>
  }
}

switch ReactDOM.querySelector("#root") {
| Some(domElement) =>
  // let name = Some("Johnny")
  ReactDOM.Client.createRoot(domElement)->ReactDOM.Client.Root.render(
    <React.StrictMode>
      // <Counter />
      // <Greetings ?name />
      // <TodoApp />
      <Header />
      <App />
    </React.StrictMode>,
  )
| None => ()
}
