type t =
  | Main
  | Todo
  | Greeting({slug: string})

let fromUrl = (url: RescriptReactRouter.url) => {
  switch url.path {
  | list{} => Main->Some
  | list{"todos"} => Todo->Some
  | list{"greetings", slug} => Greeting({slug: slug})->Some
  | _ => None
  }
}

let toString = route =>
  switch route {
  | Main => "/"
  | Todo => "/todos"
  | Greeting({slug}) => `/greetings/${slug}`
  }


// type t'
//
// external make: string => t' = "%identity"
// external toString: t' => string = "%identity"
//
// let main = "/"->make
// let todos = "/todos"->make
// let greetings = (~slug: string) => `/greetings/${slug}`->make
