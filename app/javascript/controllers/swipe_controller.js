import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swipe"
export default class extends Controller {
  dismiss(event) {
    this.element.remove()
  }
}
