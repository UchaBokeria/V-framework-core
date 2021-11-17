class System {
    constructor() {}

    ForeachIT = async (el, data) => {
        var tmpEl = el;
        var parent = el.parentNode;

        var keys = [];
            
        var text = tmpEl.innerHTML;
        var tmpbind = "";
        var record = false;
        for (let i = 0; i < text.length; i++) {
            if (record) {
                tmpbind += text[i];
            }
            if (text[i] == '{') record = true;
            else if ( i != text.length - 1 && (text[i+1] == '}') ) {
                record = false;
                keys.push(tmpbind);
                tmpbind = "";
            }
        }

        for (let i = 0; i < data.length; i++) {
            var NewHtml = text;
            keys.forEach((each) => {
                NewHtml = NewHtml.replace("{" + each + "}", data[i][each]);
            });
            
            var tmpElement = (i == 0) ? el : el.cloneNode(true);
            tmpElement.innerHTML = NewHtml;
            parent.appendChild(tmpElement);
            //parent.insertAdjacentHTML('beforeend',tmpEl);
        }
        
    }

    ForIT = async (el, nuber) => {
        var tmpEl = el;
        var parent = el.parentNode;

        parent.innerHTML = "";
        for (let i = 0; i < nuber; i++)
            parent.appendChild(tmpEl);
        
    }

    getJsonFile = async (url) => {
        const data = new Promise((resolve, reject) => {
            fetch(url)
                .then(respond => {
                    resolve(respond.json())
                }).catch(err => {
                    reject(err)
                })
        });
        
        return await data;
    }

    getFromFile = async (url) => {
        const  response = await fetch(url)
        const  text = await response.text();
        return text;
    }
    
    getResponse = async (data, URL = "response.php") => {
        var request = $.ajax({
            type: "POST",
            url: URL,
            data: data,
            dataType: "json",
            success:  (response)=> request = response,
            error: function (response) {
                console.log(response);
            }
        });

        return await request;
    }

    removeCurrentRoutes = async () => {
        var currentRoutes = document.querySelectorAll("[current='true']");
        
        currentRoutes.forEach((route) => {
            document.head.removeChild(route);
        });
    }

    getScript = async (url, CURRENT = true, type = "") => {
        var script = document.createElement("script"); 
        script.src = url + ".js";
        script.setAttribute("current",CURRENT); 
        if (type != "")
            script.type = type;
        document.head.appendChild(script); 
    }

    getStyle = async (url, CURRENT = true, type = "") => {
        if (type == "")
            type = "css";
        var style = document.createElement("link");
        style.setAttribute("current",CURRENT); 
        style.rel = 'stylesheet'; 
        style.type = 'text/' + type;
        style.href = url + "." + type; 
        document.head.appendChild(style);  
    }

    pluginRegister = async (plugins) => {
        var keys = Object.keys(plugins);

        keys.forEach( async (key) => {
            var style = document.createElement("link");
            style.rel = 'stylesheet'; 
            style.href = "Vendor/" + plugins[key] + "/" + plugins[key] + ".css"
            style.setAttribute("current", false); 

            var script = document.createElement("script"); 
            script.src = "Vendor/" + plugins[key] + "/" + plugins[key] + ".js";
            script.setAttribute("current", false); 

            document.head.appendChild(script); 
            document.head.appendChild(style); 
        });
        return;
    }

    checkAuth = async (params) => {

        var result = await this.getResponse({
            act: "checkThisGuard",
            route: "AuthGuard",
            checkRoute: params.route,
            checkAct: params.act
        });

        return !result.error;
    }

    serve = async (start) => {
        await start();
    }
}