$(document).ready(function() {
  
    
    $('.js-example-responsive').select2(
        {
            width: 'resolve',
            placeholder: "-Select-",
        }
    );
    
    $('input[name="dates"]').daterangepicker();
 
});
$('body').on('click','.ad_Modal_btn',open_ad_modal);
function open_ad_modal(){
    var selector = $(this).data("selector");
    var body = selector+'_content';
    var url = $(this).data('url');
    load_modal(selector,url,body);
}
function load_modal(selector,url,body)
{
    $(body).load(url, function () {
        $(selector).modal('show');
    });
}

function submit_form(href, data) {  
    return ajax_post(href, data);
}

function ajax_post(href, data) {
    ajax_res = '';

    $.ajax({
        data: data,
        url: href,
        type: "POST",
        async: false,
        cache: true,
        contentType:false,
        processData: false,
        success: function (data) {

           //  dd(data);
            if (data.status == "error") {
                swal_error(data.msg);
                ajax_res = 0;
            } else {
               //  swal_success1("Success");
                swal_success1(data.msg);
                if(data.redirect.length > 0)
                {
                    window.location = data.redirect;
                }
                
                ajax_res = data;
            }


        },
        error: function (data) {
            if (data.status == 419) {
                swal_error('You have logged out please login again');
                setTimeout(function () {
                    location.reload();
                }, 1000);

            }
        }

    });
    return ajax_res;
}

function swal_success1(msg = null) {
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: msg ? msg : "Success",
        showConfirmButton: false,
        timer: 1000
    })
}

$('body').on('submit', 'form.adForm', function(e) {
    e.preventDefault();

    var formData = new FormData(this);
    submit_form($(this).data("href"), formData);
    
    if (ajax_res.status == "success") {

        $('div.modal').modal('hide');
        $('form.adForm').trigger("reset");
        table.draw();
    }
    ajax_res = '';



});
$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});
function swal_confirm(title, text,url,id) {

    Swal.fire({
        title: title,
        text: text,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            let _url = `${url}/${id}`;
            let _token = $('meta[name="csrf-token"]').attr('content');
            
            $.ajax({
                url: _url,
                type: 'POST',
                data: {
                    _token: _token
                },
                success: function(response) {
                    location.reload();
                     swal(
                        'Deleted!',
                        'Deleted Successfully.',
                        'success'
                    ).then(function() {
                        location.reload();
                    });
            
                }
            });

        } else {
            return false;
        }
    });
}


