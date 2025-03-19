import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="carousel"
export default class extends Controller {
  connect() {
    let swiper = new Swiper(".swiper", {
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  }
}
