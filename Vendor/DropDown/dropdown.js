class DropDown extends System {
    constructor(options = null) {
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
        this.data            = null;

        this.options = {
            data: {
                route: "Header",
                act: "readCategories",
                url: "response.php"
            },
            area: "#mydropdown",
            output: "name",
            trigger: "#mydropdown",
            class: ["container"],
            options: {
                chosen: { name: "aa" },
                attributes: ["id", "name"],
                class: ["optionies", "red"],
            }
        };

        this.init(options);
    }

    init = async (parameters)=> {
        if (parameters != null) this.options = await this.setUpOptions(parameters);

        await this.buildContainer();
        await this.buildParameter();
        await this.buildSelected();
        await this.buildTrigger();
    }

    buildContainer = async () => {
        this.parent = document.querySelector(this.options.area);
        this.selections = document.createElement("div");
        this.selections.setAttribute("id", this.options.area.substring(1) + "Options");
        
        this.selections.classList.add("hide");
        this.options.class.forEach( (eachClass) => {
            this.selections.classList.add(eachClass);
        });
        
        this.parent.appendChild(this.selections);
    }

    buildParameter = async ()=> {
        this.optionTemplate = document.createElement("div");
        this.templateContent = document.createElement("div");
        this.templateContent.setAttribute("manager", this.options.area.substring(1) + "Template");

        this.options.options.attributes.forEach( (attr) => {
            this.templateContent.setAttribute(attr, "{" + attr + "}");
        });
        this.options.options.class.forEach( (eachClass) => {
            this.templateContent.classList.add(eachClass);
        });
        
        this.optionTemplate.appendChild(this.templateContent);
        this.selections.appendChild(this.optionTemplate);
        var templateEl = document.querySelector("[manager='" + this.options.area.substring(1) + "Template" + "'");
        templateEl.innerHTML = "{" + this.options.output + "}";
        templateEl.removeAttribute("manager");
        
        this.data = await this.getResponse( this.options.data, this.options.data.url );
        await this.ForeachIT( this.optionTemplate, this.data);
    }

    buildSelected = async () => {
        this.chosenKey = Object.keys(this.options.options.chosen)
        this.chosenValue = this.options.options.chosen[this.chosenKey];

        this.selected = document.createElement("p");
        this.selected.setAttribute("id", this.options.area.substring(1) + "Selected");
        this.selected.setAttribute("dropdown-" + this.chosenKey, this.chosenValue );
        this.selected.classList.add("dropdown-selected");
        this.parent.prepend(this.selected);
        this.selectedItem = this.data[this.data.findIndex(obj => { return obj[this.chosenKey[0]] == this.chosenValue })];
        document.querySelector(this.options.area + "Selected").innerHTML = this.selectedItem[this.options.output]
    }
    
    buildTrigger = async () => {
        document.querySelector(this.options.trigger).addEventListener("click", (e) => {
            console.log("event")
            document.querySelector(this.options.area + "Options").classList.toggle("hide");
        });
    }

    setUpOptions = async (parameters) => {
        var optionsToArray = Object.entries(this.options);
        optionsToArray.forEach((e) => {
            if (!parameters.hasOwnProperty(e[0]))  parameters[e[0]] = e[1];
            else if (typeof parameters[e[0]] == "object") {
                var tmpArr = Object.entries(e[1]);
                tmpArr.forEach((x) => {
                    if (!parameters[e[0]].hasOwnProperty(x[0]))
                        parameters[e[0]][x[0]] = x[1];
                })
            }
        });

        return parameters;
    }
}