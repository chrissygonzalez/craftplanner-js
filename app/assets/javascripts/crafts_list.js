class Craft {
    constructor(obj){
        this.id = obj.id;
        this.title = obj.title;
        this.method = obj.method;
        this.description = obj.description;
    }

    formatCraftListItem() {
        return `<li class="pt-20 red-text">
            ${this.title} (${this.method}) <a data-id="${this.id}" id="link-${this.id}" href="../crafts/${this.id}.json" class="underline">Show details</a>
            <div id="craft-${this.id}"></div>
        </li>`;
    }
}

function getList(){
    if(document.getElementById("crafts_list")) {
        const craftsList = document.getElementById("crafts_list");
        const fetchPromise = fetch('../crafts.json');
        fetchPromise.then(response => {
            return response.json();
        }).then(crafts => {
            craftsList.innerHTML = listOfCrafts(crafts);
            addCraftDetailsLinks(craftsList.getElementsByTagName('a'));
        });
    }
}

function listOfCrafts(crafts) {
    let items = crafts.map(craft => {
        let item = new Craft(craft);
        return item.formatCraftListItem();
    }).join("\n");
    return `<ul class="pl-0">${items}</ul>`;
}

function addCraftDetailsLinks(coll){
    const collArr = Array.from(coll);
    collArr.map(link => {
        link.addEventListener('click', (e) => { 
            e.preventDefault()
            getCraftDetails(link.dataset.id);
        });
    });
}

function getCraftDetails(id){
    const div = document.getElementById('craft-' + id);
    const link = document.getElementById('link-' + id);
    const fetchDetails = fetch(`../crafts/${id}.json`);
    
    if (div.innerHTML === "") {
        fetchDetails.then(response => {
            return response.json();
        }).then(craft => {
            div.innerHTML = `<p>${craft.description}</p>`;
            link.innerHTML = 'Hide details';
        });
    } else {
        div.innerHTML = "";
        link.innerHTML = 'Show details';
    }

}

document.addEventListener("DOMContentLoaded", function(){
    getList();
});