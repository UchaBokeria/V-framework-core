class Slider extends System {
    constructor(options = null) {
        super();
        this.cellTemplate = null; // it contains cells(they'll be looped and filled with data)
        this.container = null; // it contains every cell in the slider
        this.buttons = null; // it contains buttons to make a slide in container
        this.parent = null; // it contains slide buttons and container of cells
        this.data = null; // it contains the data returned from a server

        // default options for constructing
        this.options = {
            data: { route: "Home", act: "read", url: "response.php" },
            area: "#slider",
            type: "slider",
            class: ["slider", "new"],
            scrollHide: true,
            template: null,
            buttons: {
                left: true,
                right: true,
                leftClass: ["righty"],
                rightClass: ["lefty"],
                onLeft: async (e) => { console.log("left buttons has clicked"); },
                onRight: async (e) => {  console.log("right buttons has clicked"); },
            },
            cell: {
                class: ["slider-cell"],
                childClass: ["childCell"],
                attributes: ["cell-id"],
                width: "30%",
                gap: "4vw"
            }
        };
        
        this.init(options);
    }

    init = async (params) => {
        // default initalize style with out the options' parameter
        if (params != null) this.options = await this.setUpOptions(params);
        await this.buildContainer();
        await this.buildButtons();
        await this.buildCells();
        await this.build();
    }
    
    build = async () => {
        // Pack everything togather
        this.parent = document.querySelector(this.options.area);
        this.parent.classList.add("slider-parent");
        this.parent.appendChild(this.buttons.right);
        this.parent.appendChild(this.buttons.left);
        this.parent.appendChild(this.container);
    }

    buildContainer = async () => {
        // Build container
        this.container = document.createElement("div");
        this.container.setAttribute("id", this.options.area.substring(1) + "Container");
        this.container.classList.add("slider-Container");
        this.options.class.forEach( (eachClass) => {
            this.container.classList.add(eachClass);
        });

        if (this.options.scrollHide || this.options.type == "slideshow")
            this.container.classList.add("slider-scrollhide");
        if (this.options.type == "slideshow") this.container.style.scrollBehavior = "unset";
    }

    buildButtons = async () => {
        // @left
        var leftButton = document.createElement("i");
        this.options.buttons.leftClass.forEach( (eachClass) => {
            leftButton.classList.add(eachClass);
        });
        leftButton.classList.add("slider-left-button");
        leftButton.classList.add("icon-rightArrow");
        leftButton.style = "transform: rotate(180deg)";

        // @right
        var rightButton = document.createElement("i");
        this.options.buttons.rightClass.forEach((eachClass) => {
            rightButton.classList.add(eachClass);
        });

        rightButton.classList.add("slider-right-button");
        rightButton.classList.add("icon-rightArrow");
        // @display
        if (this.options.buttons.left == false) leftButton.style = "display:none";
        if (this.options.buttons.right == false) rightButton.style = "display:none";

        // @events
        leftButton.addEventListener("click", async (e) => {
            await this.options.buttons.onLeft(e);
            this.container.scrollLeft = this.container.scrollLeft - this.container.offsetWidth;
        });

        rightButton.addEventListener("click", async (e) => {
            await this.options.buttons.onRight(e);
            this.container.scrollLeft +=  this.container.offsetWidth ;
        });
        
        this.buttons = { left: leftButton, right: rightButton };
    }

    buildCells = async () => {
        // Build cells
        this.cellTemplate = document.createElement("div");
        if (this.options.type == "slideshow") {
            this.options.cell.width = "100%";
            this.options.cell.marginRight = "0";
        } else {
            this.cellTemplate.style.minWidth = this.options.cell.width;
            this.cellTemplate.style.marginRight = this.options.cell.gap;
        }
        
        this.options.cell.class.forEach( (eachClass) => {
            this.cellTemplate.classList.add(eachClass);
        });
        
        var cellContent;
        if (this.options.template != null) {
            cellContent = document.createElement("div");
            this.options.cell.attributes.forEach( (attr) => {
                cellContent.setAttribute(attr, "{" + attr + "}");
            });
            
            cellContent.innerHTML = this.options.template;
        } else {
            cellContent = document.createElement("img");
            cellContent.setAttribute("src", "{dir}");
            
            this.options.cell.attributes.forEach( (attr) => {
                cellContent.setAttribute(attr, "{" + attr + "}");
            });
            
            this.cellTemplate.appendChild(cellContent);
        }
        
        this.options.cell.childClass.forEach( (eachClass) => {
            cellContent.classList.add(eachClass);
        });
        this.cellTemplate.appendChild(cellContent);


        this.container.appendChild(this.cellTemplate);
        this.data = await this.getResponse(this.options.data, this.options.data.url);
        await this.ForeachIT(this.cellTemplate, this.data);
    }

    setUpOptions = async (parameters) => {
        var optionsToArray = Object.entries(this.options);

        optionsToArray.forEach((e) => {
            if (!parameters.hasOwnProperty(e[0]))
                parameters[e[0]] = e[1];
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
