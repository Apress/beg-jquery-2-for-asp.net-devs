///<reference path="jquery-2.0.3.js" />



(function ($) {
    $.fn.myPlugin = function (action,options) {

        var defaultOptions = {"className":"myplugin","country":"USA"};
        var settings = $.extend({},defaultOptions, options);

        if (action == "reset") {
            return this.removeClass("myplugin");
        }
        else {
            //return this.addClass("myplugin");

            //return this.each(function () {
            //    var country = $(this).data("country");
                
            //    if (country == "USA") {
            //        $(this).addClass("myplugin");
            //    }
            //});

            return this.each(function () {
                var country = $(this).data("country");
                if (country == settings.country) {
                    $(this).addClass(settings.className);
                }
            });

        }
    }


})(jQuery);

