// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'
require("stylesheets/application.scss")

// import "./selectize"
window.jQuery=$;
window.$=$;

Rails.start()
ActiveStorage.start()

if (document.querySelector('#fieldsetContainer')) {
  const createButton = document.getElementById('addAnswer');
  createButton.addEventListener("click", () => {
    console.log('test')
    const lastId = document.querySelector("#fieldsetContainer").lastElementChild.id;
    const newId = parseInt(lastId, 10) + 1;
    const newFieldset = document.querySelector('[id="0"]').outerHTML.replace(/0/g,newId);
    document.querySelector("#fieldsetContainer").insertAdjacentHTML("beforeend", newFieldset);
  })
}
