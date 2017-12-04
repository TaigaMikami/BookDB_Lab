$('#info_search_button').on('click', function(){
  const isbn = $("#book_isbn").val();
  const url = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn;
  $.getJSON(url, function(data) {
    if(!data.totalItems) {
      $("#isbn").val("");
      $("#book_title").text("エラーです");
      $("#book_author").text("");
      $("#book_description").text("");
      $("#message").html('<p class="bg-warning" id="warning">該当する書籍がありません。</p>');
      $('#message > p').fadeOut(3000);
    } else {
// 該当書籍が存在した場合、JSONをパースして入力項目のデータを取得する
      console.log(data.items[0].volumeInfo.title);
      console.log(data.items[0].volumeInfo.authors[0]);
      console.log(data.items[0].volumeInfo.publishedDate);
      $("#book_title").val(data.items[0].volumeInfo.title);
      $("#book_author").val(data.items[0].volumeInfo.authors[0]);
      $("#book_publishdate").val(data.items[0].volumeInfo.publishedDate);
      $("#book_description").text(data.items[0].volumeInfo.description);
      $("#book_thumbnail").html('<img src=\"' + data.items[0].volumeInfo.imageLinks.smallThumbnail + '\" />');
    }
  });
});
