import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="anchor-scroll"
export default class extends Controller {
  connect() {
    document.addEventListener("DOMContentLoaded", function() {
      const browseButton = document.querySelector('a[href="#browse"]');
      browseButton.addEventListener("click", function(event) {
        event.preventDefault();
        const targetElement = document.querySelector("#browse");
        const offset = targetElement.getBoundingClientRect().top - 100;
        window.scrollTo({
          top: offset,
          behavior: 'smooth'
        });
      });
    });
  }
}
