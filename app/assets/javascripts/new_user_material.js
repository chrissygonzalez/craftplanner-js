function listenForFormSubmit(){
    if (document.getElementById('new-user-material')) {
        const form = document.getElementById('new-user-material');
        form.addEventListener('submit', createNewUserMaterial);
    }
}

function createNewUserMaterial(e){
    e.preventDefault();
    const errorDiv = document.getElementById('error_explanation');
    if (isNewUserMaterialValid() !== true) {
        displayMessage(errorDiv, newUserMaterialValid());
    } else {
        console.log(getNewUserMaterialObject());

        fetch("../user_materials", {
            method: "POST",
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': Rails.csrfToken()
            },
            body: JSON.stringify(getNewUserMaterialObject())
        });
    }
}

function isNewUserMaterialValid(){
    const material_id = document.getElementById('user_material_material_id');
    let selected = material_id.options[material_id.selectedIndex].innerText;
    const material = document.getElementById('user_material_material_attributes_name').value;
    const quantity = document.getElementById('user_material_quantity').value;

    selected === "Choose a material" ? selected = "" : selected = selected;

    if (selected !== "" && material !== "") {
        return 'Please only enter one material name';
    } else if (selected === "" && material === "") {
        return 'Please enter a material name';
    } else if (quantity === "") {
        return 'Please enter a quantity';
    } else {
        return true;
    }
}

function getNewUserMaterialObject(){
    const material_id_value = document.getElementById('user_material_material_id');
    let selected = material_id_value.options[material_id_value.selectedIndex].value;
    const material_value = document.getElementById('user_material_material_attributes_name').value;
    const quantity_value = document.getElementById('user_material_quantity').value;
    const user_id_value = document.getElementById('user_material_user_id').value;

    selected === "Choose a material" ? selected = "" : selected = selected;
    
    let item;
    selected ? item = selected : item = material_value;

    return {
        user_id: user_id_value,
        material_id: selected,
        material_attributes: {
            name: material_value,
            quantity: quantity_value
        },
        quantity: quantity_value
    };
}

// {"user_id"=>"1", "material_id"=>"", "material_attributes"=>{"name"=>"try it and see"}, "quantity"=>"12"}

// {"user_id"=>"1", "material_id"=>"2", "material_attributes"=>{"name"=>""}, "quantity"=>"12"}

// function showNewMaterial(){
//     const errorDiv = document.getElementById('error_explanation');
//     const successDiv = document.getElementById('success');
//     const material_id = document.getElementById('user_material_material_id');
//     let selected = material_id.options[material_id.selectedIndex].innerText;
//     const material = document.getElementById('user_material_material_attributes_name').value;
//     const quantity = document.getElementById('user_material_quantity').value;

//     selected === "Choose a material" ? selected = "" : selected = selected;

//     if (selected !== "" && material !== "") {
//         displayMessage(errorDiv, 'Please only enter one material name');
//     } else if (selected === "" && material === "") {
//         displayMessage(errorDiv, 'Please enter a material name');
//     } else if (quantity === "") {
//         displayMessage(errorDiv, 'Please enter a quantity');
//     } else {
//         let item;
//         selected ? item = selected : item = material;

//         displayMessage(successDiv, `Added ${quantity} of ${item} to your stash`);
//     }
// }

function displayMessage(div, message){
    div.classList.replace('display-none', 'display-block');
    div.innerHTML = `<p>${message}.</p>`;
}

document.addEventListener("DOMContentLoaded", function(){
    listenForFormSubmit();
});