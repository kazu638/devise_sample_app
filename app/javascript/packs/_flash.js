document.addEventListener("turbolinks:load", () =>{
  let closebtn = document.getElementsByClassName("closebtn");
  for(let i = 0; i < closebtn.length; i++){
    closebtn[i].addEventListener("click", event => {
      closebtn[i].parentElement.classList.add("close");
    });
  }
});