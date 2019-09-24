class Craft {
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

    formatMaterialCraftListItem(){
        return `<a href="../crafts/${this.id}" class="underline red-text">${this.title}</a>`;
    }
}

