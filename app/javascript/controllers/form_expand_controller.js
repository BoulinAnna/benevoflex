import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["selectField"];

  expand(event) {
    event.currentTarget.style.transition = "margin-bottom 0.3s"
    // vérifier la margin botton de event.currentTarget
    const mb = event.currentTarget.style.marginBottom
    // si c'est 0 alors la liste n'est pas déroulée
    if (mb == "") {
      // on doit calculer la taille du margin-bottom
      const size = event.currentTarget.children.length
      event.currentTarget.style.marginBottom = `${size*29}px`
    }
    else {
      event.currentTarget.style.marginBottom = ""
    }
    // si ce n'est pas 0 la liste est déroulée
    // on lui attribut margin-bottom 0
  }

  collapse(event) {
    event.currentTarget.style.marginBottom = ""
  }
}
