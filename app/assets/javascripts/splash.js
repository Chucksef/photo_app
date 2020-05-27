// This page controls the events that will run when a user navigates
// to the landing page (root) of the website.

window.addEventListener("turbolinks:load", landingPage);

function landingPage() {
    let pth = document.querySelector("body").classList.toString();
    if (pth == "routes root") {
        
        // THIS IS WHERE ALL LANDING PAGE CODE RUNS


    }
}