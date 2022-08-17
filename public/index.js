document.addEventListener("DOMContentLoaded", event => {
  let buttons = document.querySelectorAll('.move-btn')

  buttons.forEach(button => {
    button.addEventListener("click", event => {
      document.getElementById('instruction').value = event.target.textContent
    })
  });
});