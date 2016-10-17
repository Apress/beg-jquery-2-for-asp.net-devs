///<reference path="jquery-2.0.3.js" />



(function ($) {
    $.fn.popupAd = function (options) {
        var defaultOptions = {
            adText: "This is ad text",
            adLink: "http://www.website.com",
            adCssClass: "ad",
            offset: 5,
            fadeInterval:200
        };
        var settings = $.extend({}, defaultOptions, options);
        var adMarkup = $("<div class='" + settings.adCssClass + "'>" +
                    settings.adText +
                    "<br>" +
                    "<a href='" + settings.adLink + "'>" +
                    settings.adLink + "</a>" +
                    "</div>");
        $(document.body).append(adMarkup);

        var flag = false;
        adMarkup.hover(function () {
            flag = true;
            $("." + settings.adCssClass).show();
        }, function () {
            flag = false;
            $("." + settings.adCssClass).hide();
        });

        this.hover(function (evt) {
            $("." + settings.adCssClass).css("top",  $(this).position().top + $(this).height()+ settings.offset);
            $("." + settings.adCssClass).css("left", $(this).position().left + settings.offset);
            $("." + settings.adCssClass).fadeIn(settings.fadeInterval);
        }, function (evt) {
            window.setTimeout(function () {
                if (!flag) {
                    $("." + settings.adCssClass).fadeOut(settings.fadeInterval);
                }
            }, 1000)
        });
        return this;
    }
})(jQuery);

