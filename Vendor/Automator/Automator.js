class Automator extends System {
    constructor(options) {
        super();
        this.optionTemplate  = null;
        this.templateContent = null;
        this.selectedItem    = null;
        this.chosenValue     = null;
        this.selections      = null;
        this.container       = null;
        this.chosenKey       = null;
        this.selected        = null;
        this.parent          = null;
        this.data = null;
        this.parentSections = null;

        this.options = {
            data: {
                route: "Automator",
                act: "build",
                url: "../../response.php"
            },
            area: "#Automator",
            classes: ["container"],
            options: {
                chosen: { name: "aa" },
                attributes: ["id", "name"],
                class: ["optionies", "red"],
            }
        };

        this.init();
    }

    init = async () => {
        this.parent          = document.querySelector(this.options.area);
        console.log(this.parent)
        this.selectedItem    = null;
        this.chosenValue     = null;
        this.selections      = null;
        this.container       = null;
        this.chosenKey       = null;
        this.selected        = null;

        await this.build();
    }
    
    build = async () => {
        this.data = await this.getResponse(this.options.data, this.options.data.url);
        
        console.log("ALLDATA");
        console.log(this.data)

        console.log("PARENTS");
        this.parentSections = this.data.filter((obj) => { return (obj.parent == 0) });
        console.log(this.parentSections)

        
        
        this.parentSections.forEach(async (each) => {
            // build parent
            var NewElement = await this.buildElement(each);
            var NewElementDiv = document.createElement("div");
            NewElementDiv.setAttribute("id", each.id + "Container");
            if(each.view === "false") NewElementDiv.classList.add("hide");

            if(each.changeAble === "true") {
                var trigger = await this.buildTrigger(each);
                NewElementDiv.appendChild(trigger);
            } 

            NewElementDiv.appendChild(NewElement);
            this.parent.appendChild(NewElementDiv);

            // build it's children
            var children = this.data.filter((obj) => { return (obj.parent == each.unique_id) })
            console.log(children);
            children.forEach( async (child) => {
                var NewChildElement = await this.buildElement(child);
                NewElement.appendChild(NewChildElement);
            });
        });

    }

    buildElement = async (each) => {
        var NewElement = document.createElement(each.el);
        NewElement.setAttribute("id", each.id);

        each.classes.forEach( (eachClass) => {
            NewElement.classList.add(eachClass);
        });

        each.attributes.forEach((attr) => {
            var attributeObject = Object.entries(attr)[0];
            NewElement.setAttribute(attributeObject[0], attributeObject[1]);
        });

        NewElement.setAttribute("sectionNumber", each.section);

        return NewElement;
    }

    buildTrigger = async (each) => {
        var trigger = document.createElement("i");
        trigger.append("a");
        trigger.setAttribute("changeFrom", each.unique_id);
        trigger.setAttribute("changeTo", each.onChange.toString());

        trigger.addEventListener("click", (e) => {

            document.querySelector("#" + each.id + "Container").classList.toggle("hide");
            each.onChange.forEach((change_id) => {
                console.log(change_id)
                var changeEl = this.data[this.data.findIndex(obj => { return obj.unique_id == (change_id) })];
                document.querySelector("#" + changeEl.id + "Container").classList.toggle("hide");
            });

        });

        return trigger;
    }
}