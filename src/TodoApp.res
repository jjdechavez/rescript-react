type todo = {
  id: int,
  content: string,
  completed: bool,
}

type action =
  | AddTodo(string)
  | RemoveTodo(int)
  | ToggleTodo(int)

type state = {
  todos: array<todo>,
  nextId: int,
}

let reducer = (state, action) =>
  switch action {
  | AddTodo(content) =>
    let todos = Js.Array2.concat(state.todos, [{id: state.nextId, content, completed: false}])
    {todos, nextId: state.nextId + 1}
  | RemoveTodo(id) =>
    let todos = Js.Array2.filter(state.todos, todo => todo.id !== id)
    {...state, todos}
  | ToggleTodo(id) =>
    let todos = Belt.Array.map(state.todos, todo =>
      if todo.id === id {
        {
          ...todo,
          completed: !todo.completed,
        }
      } else {
        todo
      }
    )
    {...state, todos}
  }

let initialTodos = [{id: 1, content: "Try Rescript & React", completed: false}]

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(reducer, {todos: initialTodos, nextId: 2})
  let (content, setContent) = React.useState(_ => "")

  let todos = Belt.Array.map(state.todos, todo =>
    <li key={Belt.Int.toString(todo.id)} className="grid">
      {React.string(todo.content)}
      <button onClick={_ => dispatch(RemoveTodo(todo.id))}> {React.string("Remove")} </button>
      <input
        type_="checkbox" checked=todo.completed onChange={_ => dispatch(ToggleTodo(todo.id))}
      />
    </li>
  )

  let onChange = evt => {
    ReactEvent.Form.preventDefault(evt)
    let value = ReactEvent.Form.target(evt)["value"]
    setContent(_prev => value)
  }

  let onAddTodo = content => {
    dispatch(AddTodo(content))
    setContent(_ => "")
  }

  <section className="mt-4">
    <h1> {React.string("Todo List:")} </h1>
    <div>
      <input type_="input" onChange value=content />
      <button type_="submit" onClick={_ => onAddTodo(content)}> {React.string("Add todo")} </button>
    </div>
    <ul> {React.array(todos)} </ul>
  </section>
}
