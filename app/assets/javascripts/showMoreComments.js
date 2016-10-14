$( document ).ready(function() {
  $(document).on('click', '.more-comments', function() {
    $(this).on('ajax:success', function(event, data, status, xhr) {
      let postId = $(this).data("post-id");
      $("#comments_" + postId).html(data);
      $("#comments-paginator-" + postId).html("<a id='more-comments' data-post-id=" + postId + "data-type='html' data-remote='true' href='/posts/" + postId + "/comments>show more comments</a>");
    });
  });
});