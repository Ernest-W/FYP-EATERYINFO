
function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
    $("#name").text(profile.getName());
    var name = profile.getName();
    localStorage.setItem("lastname", "Smith");
    console.log(name);
    //$("#email").text(profile.getEmail());
    //storeinlclsessemail(profile.getEmail());
    //$("#image").attr('src', profile.getImageUrl());
    //storeinlclsessimage(profile.getImageUrl());
    $(".data").css("display", "block");
    $(".g-signin2").css("display", "none");
}
//redirect codes include above ^^
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        alert("You have been signed out successfully");
        $(".g-signin2").css("display", "block")
        $(".data").css("display", "none");
    });
}

//function storeinlclsessname(username) {
//    // store
//    localStorage.setItem("username", username);
//}
//function storeinlclsessemail(email) {
//    // store
//    localStorage.setItem("useremail", email);
//}
//function storeinlclsessimage(imgurl) {
//    // store
//    localStorage.setItem("userimgurl", imgurl);
//}