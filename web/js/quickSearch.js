
jQuery(function ($) {
    $("#quickSearchBar").keypress(function (e)
    {
        quickSearch(e, $(this));
    });
});

function quickSearch(e, me)
{
    if (e.keyCode === 13)
    {
        window.location = "/HardCover/HardCover-browse.jsp#" + me.val();
        populateSearch($);
    }
};


