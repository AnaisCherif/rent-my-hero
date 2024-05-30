import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static values = { open: Boolean }

  connect() {
    this.modal = new bootstrap.Modal(this.element);
    if (this.openValue) {
      this.modal.show()
    }
  }
}
