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
        // console.log(list);
    return `<ul class="pl-0">${list}</ul>`;
}

function addCraftDetailsLinks(coll){
    // coll.map(item => console.log(item));
    // console.log(coll[0]);
    const collArr = Array.from(coll);
    collArr.map(link => {
        // console.log(link.dataset.id);
        link.addEventListener('click', (e) => { 
            e.preventDefault()
            getCraftDetails(link.dataset.id);
        });
    });

    coll[0].addEventListener('click', (e) => { 
        e.preventDefault()
        getCraftDetails(1);
    });
}

function getCraftDetails(id){
    const div = document.getElementById('craft-' + id);
    div.innerHTML = id;
}

document.addEventListener("DOMContentLoaded", function(){
    getList();
});