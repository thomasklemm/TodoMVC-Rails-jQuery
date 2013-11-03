// Replace urls with push state
if (history && history.pushState) {
  $(function() {
    Todo.filters.on("click", function(e) {
      $.getScript(this.href);
      history.pushState(null, document.title, this.href);
      e.preventDefault();
    });
    $(window).bind("popstate", function() {
      $.getScript(location.href);
    });
  });
}
