 

$(document).ready(function() {
   
    $(document).on('click','.custom-file-input', function(){
         $('div.file_holder').val(this.id);
         $("#emdadUploader").modal('show');
    });


  $(document).on('click','.uploaded_images', function(){
      arrp=[];
      var type;
      
      var type = $("#inputGroupFile01").data('type');
      if(type != 'multiple')
      {
        $("div").removeClass("item_selected");

      }
      $(this).toggleClass('item_selected'); 
     });


      
     $(document).on('click','#add_files', function()
     {  let inp=$('div.file_holder').val();
        let dv='';
        console.log(inp);

       
        let ids=[];
        var html='';
        $('.item_selected').each(function(i, obj) {
           
            ids.push($(this).data('id'));
            html+='<div class="card p-1 mr-1" style="width: 5rem;"><img class="card-img-top" src="'+$(this).data('name')+'" alt="Card image cap">'+
            '<button class="btn btn-sm  remove-attachment" data-id="'+inp+'" data-value="'+$(this).data('id')+'" type="button">X</button></div>';
        });

        console.log(ids);
        document.getElementById(inp).value=ids;
        $("label[for='" + inp + "']").html(ids.length+' files selected');
        $("div[for='" + inp + "']").html(html);

         console.log(dv);
        $("#emdadUploader").modal('hide');

        


     });
     $(document).on('click','.remove-attachment', function(){
        $(this).parent().remove();
        let id_arr;
        var ids = document.getElementById($(this).data('id')).value;
        id_arr = ids.split(',');
        
        id_arr.splice( $.inArray($(this).data('value'), id_arr), 1 );
        console.log(id_arr);
        document.getElementById($(this).data('id')).value = id_arr;

        $("label[for='" + $(this).data('id') + "']").html(id_arr.length+' files selected');
        
     });


});

