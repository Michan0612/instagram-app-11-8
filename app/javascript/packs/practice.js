function readURL(input) {
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      axios.post('profile') 

        .then((res) => {
        
          reader.onload = function (e) {
            $('#avatar_img_prev').attr('src', e.target.result);
          }
    
          reader.readAsDataURL(input.files[0]);
        } )
    }
  }
 
  $("#post_img").change(function(){
    $('#avatar_img_prev').removeClass('hidden');
    $('.avatar_present_img').remove();
    
    readURL(this);
  });