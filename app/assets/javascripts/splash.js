// This page controls the events that will run when a user navigates
// to the landing page (root) of the website.

// window.addEventListener("load", landingPage);
window.onload = function() {
    alert("page is loaded");
};

function landingPage() {
    let pth = document.querySelector("body").classList.toString();
    if (pth == "routes root") {
        alert("SPLASH!!!");
    }
}