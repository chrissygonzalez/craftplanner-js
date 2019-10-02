function getList(){
    if(document.getElementById("crafts_list")) {
        const fetchPromise = fetch('../crafts.json');
        fetchPromise.then(response => {
            return response.json();
        }).then(crafts => {
            displayCraftsWithListeners(crafts);
        });
    }
}

function displayCraftsWithListeners(crafts){
    const craftsList = document.getElementById("crafts_list");
    craftsList.innerHTML = listOfCrafts(crafts);
    addCraftDetailsLinks(craftsList.getElementsByClassName('toggle'));
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

function addSortButtonListener(){
    if(document.getElementById("sort-button")) {
        const btn = document.getElementById('sort-button');
        btn.addEventListener('click', (e) => {
            console.log('here');
            getAlphaCraftList();
        });
    }
}

function getAlphaCraftList(){
    const craftsList = document.getElementById("crafts_list");
    const fetchPromise = fetch('../crafts.json');
    fetchPromise.then(response => {
        return response.json();
    }).then(crafts => {
        alphaSortCrafts(crafts);
        displayCraftsWithListeners(crafts);
    });
}

function alphaSortCrafts(crafts){
    return crafts.sort(function(a, b) {
        var nameA = a.title.toUpperCase(); // ignore upper and lowercase
        var nameB = b.title.toUpperCase(); // ignore upper and lowercase
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
      
        // names must be equal
        return 0;
      });
}

document.addEventListener("DOMContentLoaded", function(){
    getList();
    addSortButtonListener();
});