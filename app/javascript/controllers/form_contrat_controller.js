import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-contrat"
export default class extends Controller {
  static targets
  static targets = ["submitbtn"]
  connect() {
    this.submitbtnTarget.hidden = true
  }

  remotesubmit() {
    this.submitbtnTarget.click()
  }
}