import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["card"]
  like(event) {
    this.cardTarget.classList.add("card-to-right")
    setTimeout(() => {
      this.element.remove()
    }, 1000);
  }

  dislike(event) {
    this.cardTarget.classList.add("card-to-left")
    setTimeout(() => {
      this.element.remove()
    }, 1000);
  }
}
