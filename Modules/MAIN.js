var system = new System();

system.serve( async ()=> {
    
    await system.pluginRegister({
        "charts": "ApexCharts",
        "dropdowns": "DropDown",
        "Automator": "Automator",
        "Translater": "Translater",
        "JqueryPlugin": "JqueryPlugin",
        "slideshow/carousel": "Slider",
    });

    const CallRouter = new Router();
    await CallRouter.route("Main", null, false);

});