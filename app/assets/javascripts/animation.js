$(document).ready(function() {
	let timer	
	// Function to change the text
	function changeText() {   
		word = document.getElementById("verb");
		if (word !== null) {
			if  (word.textContent.toLowerCase() === "collaborer") {
				word.textContent = "travailler";
			} else if  (word.textContent.toLowerCase() === "rencontrer") {
				word.textContent = "collaborer";
			} else if  (word.textContent.toLowerCase() === "travailler") {
				word.textContent = "rencontrer";
			}
		}
	}
});