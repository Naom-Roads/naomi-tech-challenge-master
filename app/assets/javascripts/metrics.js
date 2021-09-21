var loadMore = function(btn) {
  var btn = $(btn);
  var category = btn.data('category');
  var page = btn.data('page');
  var sort = btn.data('sort');

 
  if(page == 0) {
    var url = btn.attr('href') + "?category=" + category + "&sort=" + sort;
  } else {
    var url = btn.attr('href') + "?category=" + category + "&page=" + page + "&sort=" + sort;
  }


  console.log(url);

  $.ajax({
    url: url,
    dataType: "json",
    type: "GET",
    success: function(response) {
      var table = $('table#report-table').find('tbody');
      if(page == 0) { 
        table.html(''); 
        console.log(response.sort == 'ASC');
        $('#btn-load-more').data('sort', response.sort).data('page', 1); 
        $('#sort-toggle').data('sort', (response.sort == 'ASC') ? 'DESC' : 'ASC');
        $('#sort-toggle').find('i').toggleClass('fa-caret-square-up').toggleClass('fa-caret-square-down');
        
       } else {
        btn.data('page', parseInt(page, 10) + 1);     
      }
      $(response.metrics).each(function() {
         var row = $('<tr>')
            .append($('<td>').text(this.machine_id))
            .append($('<td>').text(this.value));
         table.append(row);
      });
    },
    error: function(response) {
      alert("Unable to load data.");
    }
  });
}

$(document).ready(function (){
   $('body').on('click', '#btn-load-more, #sort-toggle', function(e){  
      e.preventDefault();
      loadMore(this);
   });
});

