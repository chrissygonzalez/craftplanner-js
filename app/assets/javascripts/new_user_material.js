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

    // only call this if the send works, otherwise throw an error?
    showNewMaterial();
}

function showNewMaterial(){
    const material_id = document.getElementById('user_material_material_id');
    const selected = material_id.options[material_id.selectedIndex].innerText;
    const material = document.getElementById('user_material_material_attributes_name').value;
    const quantity = document.getElementById('user_material_quantity').value;

    console.log(selected);
    console.log(material);
    console.log(quantity);
}

document.addEventListener("DOMContentLoaded", function(){
    listenForFormSubmit();
});