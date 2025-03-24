import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["selectContainer"];

  expand(event) {
    event.currentTarget.parentElement.classList.add("visible");
  }

  collapse(event) {
    event.currentTarget.parentElement.classList.remove("visible");
  }
}
