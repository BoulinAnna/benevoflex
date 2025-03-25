import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["selectField"];

  expand(event) {
    const active = event.currentTarget.dataset.active
    // si c'est 0 alors la liste n'est pas déroulée
    if (active == "false") {
      // on doit dérouler la liste
      this.selectFieldTarget.classList.add("search-dropdown-active")
      event.currentTarget.dataset.active = "true"
    }
    else {
      this.selectFieldTarget.classList.remove("search-dropdown-active")
      event.currentTarget.dataset.active = "false"
    }
  }
}
