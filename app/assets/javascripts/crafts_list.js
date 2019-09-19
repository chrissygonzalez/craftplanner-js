class Craft {
    constructor(obj){
        this.id = obj.id;
        this.title = obj.title;
        this.method = obj.method;
        this.description = obj.description;
    }

    formatCraftListItem() {
        return `<li class="pt-20">
            <span class="red-text">${this.title} (${this.method})</span> <a data-id="${this.id}" id="link-${this.id}" class="toggle" href="../crafts/${this.id}.json" class="underline">Show details</a>
            <div id="craft-${this.id}"></div>
            <a href="../crafts/${this.id}" id="button-${this.id}" class="button-gray display-none">See full description</a>
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
            addCraftDetailsLinks(craftsList.getElementsByClassName('toggle'));
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
            toggleCraftDetails(link.dataset.id);
        });
    });
}

function toggleCraftDetails(id){
    const div = document.getElementById('craft-' + id);
    const link = document.getElementById('link-' + id);
    const btn = document.getElementById('button-' + id);
    const fetchDetails = fetch(`../crafts/${id}.json`);
    
    if (div.innerHTML === "") {
        fetchDetails.then(response => {
            return response.json();
        }).then(craft => {
            div.innerHTML = `<p>${craft.description}</p>`;
            link.innerHTML = 'Hide details';
            btn.classList.replace('display-none', 'display-inline-block');
        });
    } else {
        div.innerHTML = "";
        link.innerHTML = 'Show details';
        btn.classList.replace('display-inline-block', 'display-none');
    }

}

document.addEventListener("DOMContentLoaded", function(){
    getList();
});