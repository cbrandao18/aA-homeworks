document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const handleFavoriteSubmit = (e) => {
    e.preventDefault();

    //grab input element
    const favoriteInputEl = document.querySelector(".favorite-input");
    const favoriteVal = favoriteInputEl.value;
    favoriteInputEl.value = "";
    //create the li to add onto the ul, fill it in with the value they added in the input box
    const newListLi = document.createElement("li");
    newListLi.textContent = favoriteVal;
    //get the ul list, and append the new li to it
    const favoritesList = document.getElementById("sf-places");
    favoritesList.appendChild(newListLi);
  };

  //get submit button, add the listener on it
  const listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", handleFavoriteSubmit);



  // adding new photos

  const showPhotoUploadForm = (e) => {
    //get the toggle form button, set it to hidden or not depending on the click handler
    const photoFormEl = document.querySelector(".photo-form-container");
    if (photoFormEl.className === "photo-form-container") {
      photoFormEl.className = "photo-form-container hidden";
    } else {
      photoFormEl.className = "photo-form-container";
    }
  };

  //get the toggle form button, add click handler
  const photoFormShowButton = document.querySelector(".photo-show-button");
  photoFormShowButton.addEventListener("click", showPhotoUploadForm);


  const handlePhotoSubmit = (e) => {
    e.preventDefault();
    //get the input el for the photo upload
    const photoUrlInputEl = document.querySelector(".photo-url-input");
    const photoUrl = photoUrlInputEl.value;
    photoUrlInputEl.value = "";
    //create new html img tag
    const newImg = document.createElement("img");
    newImg.src = photoUrl;
    //create an li with the photo
    const newPhotoLi = document.createElement("li");
    newPhotoLi.appendChild(newImg);
    //get the ul of all the dog photos and append the new photo to it
    const dogPhotosList = document.querySelector(".dog-photos");
    dogPhotosList.appendChild(newPhotoLi);
  };
  //add listenner on the photo submit button
  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", handlePhotoSubmit);



});
