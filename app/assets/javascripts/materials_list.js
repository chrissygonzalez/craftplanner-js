var Craft = class {
    constructor(obj){
        this.id = obj.id;
        this.title = obj.title;
        this.method = obj.method;
        this.description = obj.description;
        this.materials = obj.materials;
    }

    formatCraftListItem() {
        return `<li class="pt-20">
            <span class="red-text">${this.title} (${this.method})</span> <a data-id="${this.id}" id="link-${this.id}" class="toggle" href="../crafts/${this.id}.json" class="underline">Show details</a>
            <div id="craft-${this.id}"></div>
            <a href="../crafts/${this.id}" id="button-${this.id}" class="button-gray display-none">See full description</a>
        </li>`;
    }
}

function addCraftListLinks(){
    if(document.getElementsByClassName("craft-btn")) {
        const btnArr = Array.from(document.getElementsByClassName("craft-btn"));
        btnArr.map(item => {
            item.addEventListener('click', (e) => { 
                e.preventDefault()
                getMaterialCraftList(item.dataset.id);
            });
        });
    }
}

function getMaterialCraftList(id){
    const div = document.getElementById(`material-${id}`);

    const fetchPromise = fetch(`../materials/${id}.json`);
    fetchPromise.then(response => {
        return response.json();
    }).then(material => {
        const list = formatMaterialCraftList(material.crafts);
        div.innerHTML = list;
    });
}

function formatMaterialCraftList(crafts){
    let craftArr = [];
    crafts.map(craft => {
        craftArr.push(craft.title);
    });
    return craftArr.join(", ");
}

document.addEventListener("DOMContentLoaded", function(){
    addCraftListLinks();
});