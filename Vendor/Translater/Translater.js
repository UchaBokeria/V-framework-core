class Translater extends System {
    constructor() {
        super();
        this.data = null;
        this.options = null;
    }

    init = async (parameters) => {
        this.options = {
            route: "Languager",
            act: "getTranslation",
            url: "response.php",
            page_id: "0",
            lang_id: "1"
        }

        if (parameters != null) this.options = await this.setUpOptions(parameters);
        await this.getTranslation();
        await this.translate();
    }

    translate = async () => {
        var contentTexts = document.querySelectorAll("[Vtext]");

        contentTexts.forEach((text) => {
            var key = text.getAttribute("Vtext");
            var content = this.data.find((obj) => { return obj.lang_key == key });
            text.innerHTML = content.lang_value;
        });
        
    }

    getTranslation = async () => {
        this.data = await this.getResponse( 
            this.options ,
            this.options.url 
        );
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

const Translate = new Translater();