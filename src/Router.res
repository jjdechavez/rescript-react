let push = (route: Route.t) => route->Route.toString->RescriptReactRouter.push

module Link = {
  @react.component
  let make = (~route: Route.t, ~children) => {
    let location = route->Route.toString

    <a
      href=location
      onClick={evt => {
        evt->ReactEvent.Mouse.preventDefault
        location->RescriptReactRouter.push
      }}>
      children
    </a>
  }
}
