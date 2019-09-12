function getList(){
    if(document.getElementById("projects_list")) {
        const projectsList = document.getElementById("projects_list");
        const fetchPromise = fetch('../crafts.json');
        fetchPromise.then(response => {
            return response.json();
        }).then(crafts => {
            projectsList.innerHTML = listOfCrafts(crafts);
        });
    }
}

function listOfCrafts(crafts) {
    const list = crafts.map(craft => `<li>${craft.title} (${craft.method})</li>`).join("\n");
    return `<ul>${list}</ul>`;
}

document.addEventListener("DOMContentLoaded", function(){
    // Handler when the DOM is fully loaded
    getList();
  });

//   document.addEventListener("turbolinks:load", function() {  getList(); })