function addCraftListLinks(){
    if(document.getElementsByClassName("craft-btn")) {
        const btnArr = Array.from(document.getElementsByClassName("craft-btn"));
        btnArr.map(item => {
            item.addEventListener('click', (e) => { 
                e.preventDefault()
                toggleMaterialCrafts(item.dataset.id);
            });
        });
    }
}

function toggleMaterialCrafts(id){
    const div = document.getElementById(`material-${id}`);
    if (div.innerHTML === "") {
        getMaterialCraftList(id);
        document.getElementById(`button-${id}`).innerHTML = 'Hide crafts';
    } else {
        div.innerHTML = "";
        document.getElementById(`button-${id}`).innerHTML = 'Show crafts';
    }
}

function getMaterialCraftList(id){
    const div = document.getElementById(`material-${id}`);
    const fetchPromise = fetch(`../materials/${id}.json`);

    fetchPromise.then(response => {
        return response.json();
    }).then(material => {
        if (material.crafts.length) {
            const list = formatMaterialCraftList(material.crafts);
            div.innerHTML = `Used in ${list}`;
        } else {
            div.innerHTML = "Not used in any crafts yet.";
        }
    });
}

function formatMaterialCraftList(crafts){
    let craftArr = [];
    crafts.map(craft => {
        let item = new Craft(craft);
        craftArr.push(item.formatMaterialCraftListItem());
    });
    return craftArr.join(", ");
}

document.addEventListener("DOMContentLoaded", function(){
    addCraftListLinks();
});