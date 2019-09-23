function listenForFormSubmit(){
    if (document.getElementById('new-user-material')) {
        const form = document.getElementById('new-user-material');
        form.addEventListener('submit', createNewUserMaterial);
    }
}

function createNewUserMaterial(e){
    e.preventDefault();
    const form = document.getElementById('new-user-material');
    const request = new XMLHttpRequest();
    request.open("POST", '../user_materials');
    request.send(new FormData(form));
}

document.addEventListener("DOMContentLoaded", function(){
    listenForFormSubmit();
});