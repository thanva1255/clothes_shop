import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "s", "m", "l", "xl", "button", "buttonDefault"]

  connect() {
    this.hideAll()
    this.removeAllBackgroundColor()

    this.sTarget.hidden = false

    this.buttonDefaultTarget.classList.add("bg-gray-200")
  }

  hideAll() {
    this.sTarget.hidden = true
    this.mTarget.hidden = true
    this.lTarget.hidden = true
    this.xlTarget.hidden = true
  }

  removeAllBackgroundColor() {
    this.buttonTargets.forEach(element => {
      element.classList.remove("bg-gray-200")
    })
  }

  changeTabSize(event){
    const size = event.params.size

    this.hideAll()
    this.removeAllBackgroundColor()

    this[`${size}Target`].hidden = false

    event.target.classList.add("bg-gray-200")
  }
}
