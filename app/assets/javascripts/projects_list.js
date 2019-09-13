function getList(){
    if(document.getElementById("projects_list")) {
        const projectsList = document.getElementById("projects_list");
        const fetchPromise = fetch('../crafts.json');
        fetchPromise.then(response => {
            return response.json();
        }).then(crafts => {
            projectsList.innerHTML = listOfCrafts(crafts);
            addCraftDetailsLinks(projectsList.getElementsByTagName('a'));
        });
    }
}

function listOfCrafts(crafts) {
    const list = crafts.map(craft => 
        `<li class="pt-20 red-text">
            ${craft.title} (${craft.method}) <a data-id="${craft.id}" href="../crafts/${craft.id}.json" class="underline">See details</a>
            <div id="craft-${craft.id}"></div>
        </li>`
        ).join("\n");
    return `<ul class="pl-0">${list}</ul>`;
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

    const fetchDetails = fetch(`../crafts/${id}.json`);
    fetchDetails.then(response => {
        return response.json();
    }).then(craft => {
        // console.log(craft);
        div.innerHTML = `<p>${craft.description}</p>`;
    });

}

document.addEventListener("DOMContentLoaded", function(){
    getList();
});