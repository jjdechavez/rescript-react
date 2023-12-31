// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Route from "./Route.bs.mjs";
import * as Counter from "./Counter.bs.mjs";
import * as TodoApp from "./TodoApp.bs.mjs";
import * as Greetings from "./Greetings.bs.mjs";
import * as JsxRuntime from "react/jsx-runtime";
import * as RescriptReactRouter from "@rescript/react/src/RescriptReactRouter.bs.mjs";

function App(props) {
  var route = Route.fromUrl(RescriptReactRouter.useUrl(undefined, undefined));
  if (route !== undefined) {
    if (typeof route === "number") {
      if (route !== 0) {
        return JsxRuntime.jsx(TodoApp.make, {});
      } else {
        return JsxRuntime.jsx(Counter.make, {});
      }
    } else {
      return JsxRuntime.jsx(Greetings.make, {
                  name: route.slug
                });
    }
  } else {
    return JsxRuntime.jsx("h1", {
                children: "Not Found"
              });
  }
}

var make = App;

export {
  make ,
}
/* Counter Not a pure module */
