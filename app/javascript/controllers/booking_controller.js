import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking"
export default class extends Controller {

  static targets = ["start_date", "end_date", "price", "info"];
  static values = { price: Number };

  connect() {
    console.log("hello");
    this.update();
    this.updatedash()
    console.log(this.priceTarget);
    console.log(this.infoTarget);
    console.log(this.end_dateTarget);
  }

  update() {

    const pricePerDay = parseInt(this.priceValue, 10);
      // make sure the user has chosen a start date and end date
    if (
      this.start_dateTarget.value !== "" &&
      this.end_dateTarget.value !== ""
    ) {
      // calculating the time from the values in the HTML
      const diffInMs =
        new Date(this.end_dateTarget.value) -
        new Date(this.start_dateTarget.value);
      const diffInDays = diffInMs / (1000 * 60 * 60 * 24);
      if (diffInDays > 0) {
        // displays the total price per nigh
        this.infoTarget.innerText = `$ ${pricePerDay} x ${diffInDays} days`;
        this.priceTarget.innerHTML = `<span>${(
          diffInDays * pricePerDay
        ).toLocaleString()} $</span> <small class='fw-light'></small> `;
      } else if (diffInDays === 0) {
        // displays 1-night minimum if end date is same as start date
        this.infoTarget.innerText = "";
        this.priceTarget.innerHTML =
          "<span class='text-danger fw-light'>24h mininum</span>";
      } else {
        // displays invalid if the end date is before the start or not overnight
        this.infoTarget.innerText = "";
        this.priceTarget.innerHTML =
          "<span class='text-danger fw-light'>Invalid dates</span>";
      }
    }
  }
  updatedash() {

    const pricePerDay = parseInt(this.priceValue, 10);
      // make sure the user has chosen a start date and end date
    if (
      this.start_dateTarget.innerText !== "" &&
      this.end_dateTarget.innerText !== ""
    ) {
      // calculating the time from the values in the HTML
      const diffInMs =
        new Date(this.end_dateTarget.innerText) -
        new Date(this.start_dateTarget.innerText);
      const diffInDays = diffInMs / (1000 * 60 * 60 * 24);
      if (diffInDays > 0) {
        // displays the total price per nigh
        this.infoTarget.innerText = `$ ${pricePerDay} x ${diffInDays} days`;
        this.priceTarget.innerHTML = `<span>${(
          diffInDays * pricePerDay
        ).toLocaleString()} $</span> <small class='fw-light'></small> `;
      } else if (diffInDays === 0) {
        // displays 1-night minimum if end date is same as start date
        this.infoTarget.innerText = "";
        this.priceTarget.innerHTML =
          "<span class='text-danger fw-light'>24h mininum</span>";
      } else {
        // displays invalid if the end date is before the start or not overnight
        this.infoTarget.innerText = "";
        this.priceTarget.innerHTML =
          "<span class='text-danger fw-light'>Invalid dates</span>";
      }
    }
  }
}
