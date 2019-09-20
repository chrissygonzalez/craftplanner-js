// console.log("Hello from the Materials List JS file!");

function addCraftListLinks(){
    if(document.getElementsByClassName("craft-btn")) {
        const btnList = document.getElementsByClassName("craft-btn");
        const btnArr = Array.from(btnList);
        btnArr.map(item => {
            item.addEventListener('click', (e) => { 
                e.preventDefault()
                getCraftList(item.dataset.id);
            });
        });
        // const fetchPromise = fetch('../crafts.json');
        // fetchPromise.then(response => {
        //     return response.json();
        // }).then(crafts => {
        //     craftsList.innerHTML = listOfCrafts(crafts);
        //     addCraftDetailsLinks(craftsList.getElementsByClassName('toggle'));
        // });
    }
}

function getCraftList(id){
    // console.log("Getting Craft number " + id);
    const div = document.getElementById(`material-${id}`);
    div.innerHTML = "Getting Craft number " + id;
}

document.addEventListener("DOMContentLoaded", function(){
    addCraftListLinks();
});