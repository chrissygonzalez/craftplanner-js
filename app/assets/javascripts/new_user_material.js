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

    showNewMaterial();
}

function showNewMaterial(){
    const errorDiv = document.getElementById('error_explanation');
    const successDiv = document.getElementById('success');
    const material_id = document.getElementById('user_material_material_id');
    let selected = material_id.options[material_id.selectedIndex].innerText;
    const material = document.getElementById('user_material_material_attributes_name').value;
    const quantity = document.getElementById('user_material_quantity').value;

    selected === "Choose a material" ? selected = "" : selected = selected;

    if (selected !== "" && material !== "") {
        displayMessage(errorDiv, 'Please only enter one material name');
    } else if (selected === "" && material === "") {
        displayMessage(errorDiv, 'Please enter a material name');
    } else if (quantity === "") {
        displayMessage(errorDiv, 'Please enter a quantity');
    } else {
        let item;
        selected ? item = selected : item = material;

        displayMessage(successDiv, `Added ${quantity} of ${item} to your stash`);
    }
}

function displayMessage(div, message){
    div.classList.replace('display-none', 'display-block');
    div.innerHTML = `<p>${message}.</p>`;
}

document.addEventListener("DOMContentLoaded", function(){
    listenForFormSubmit();
});