var ajax_data;
var ajax_res;
var search_results_selector='';
var current_row;
$('document').ready(function () {
    $('select.custom-select2').select2({
        theme: 'bootstrap-5',
    });
});
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

            
            if (data.status == "error") {
                swal_error(data.msg);
                ajax_res = 0;
            } else {

                swal_success(data.msg);
                // if(data.flags&&data.flags.return_path){

                //     window.location.href = data.flags.return_path;
                // }
                // if(data.flags.refresh!=''){

                //     window.location.href = data.flags.return_path;
                // }
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


// ajax_fun(href, method, data) {

// }
function isEmpty(data) {
    return $.isEmptyObject(data);
}

function ajax_get(href, data = null, async = false, ajax_callback = null, call_back_parms = null) {

    $.ajax({
        url: href,
        async: async,
        cache: true,
        type: 'GET',
        data: data ?? null,
        dataType: 'json', // added data type
        success: function (res) {
            ajax_data = res;

            if (async == true) {

                window[ajax_callback](res);
                return;
            }
            return res;

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

    return ajax_data;
}

function swal_confirm(title, text, fnName = null, arg = null) {

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

            if (fnName.length > 0) {
                window[fnName](arg);
            }

        } else {
            return false;
        }
    });
}


function generate_dt(selector, url, columns, show_buttons = true) {
    var buttons = [
        
        {
        extend: 'colvis',
            collectionLayout: 'fixed columns',
            collectionTitle: 'Spalten Auswahl'
        },
        {
        extend: 'copy',
        text: 'Copy',
        exportOptions: {
            columns: ':visible'
          
        }
    }, {
        extend: 'excel',
        text: 'Excel',
        exportOptions: {
            columns: ':visible'
           
        },
        
    },
    {
        extend: 'pdf',
        text: 'PDF',
        exportOptions: {
            columns: ':visible'
           
        },
        
    },

    ];

    console.log(selector);
    var dom = show_buttons ? "<'row'<'col-sm-12 col-md-4'l><'col-sm-12 col-md-4'B><'col-sm-12 col-md-4'f>>" +
        "<'row'<'col-sm-12'tr>>" +
        "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>" : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
        "<'row'<'col-sm-12'tr>>" +
    "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>";
    var table = $(selector).DataTable({
        processing: true,
        serverSide: true,
        dataType: "JSON",
        responsive: false,
        info: true,
        language: {
            oPaginate: {
                sNext: '<i class="fa fa-forward"></i>',
                sPrevious: '<i class="fa fa-backward"></i>',
                sFirst: '<i class="fa fa-step-backward"></i>',
                sLast: '<i class="fa fa-step-forward"></i>'
            },
            url: data_table_lang

        },
        dom: dom,
        buttons: buttons,
        bPaginate: true,
        bLengthChange: true,
        bInfo: true,
        paging: true,
        pageLength: 10,
        lengthMenu: [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
        ajax: url,
        search: {
            regex: true
        },
        columns: columns
    });


    return table;

}


function swal_success(msg = null) {
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: msg ? msg : "Success",
        showConfirmButton: false,
        timer: 1000
    })
}
// error alert
function swal_error(msg = null) {

    Swal.fire({
        position: 'center',
        icon: 'error',
        title: msg,
        showConfirmButton: true,
    })
}


var ajax_per = 0;
$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    },

    beforeSend: function () {
        //$('#preload').fadeIn();


    },
    complete: function () {
        //$('#preload').fadeOut();
    },
    success: function () {
        //$('#preload').fadeOut() ;
    },

});




$('body').on('click', '.cm_Modal_btn', open_cm_modal);
$('body').on('click', '.offcanvasBtn', open_cm_offcanvas);
$('body').on('click','.ad_Modal_btn',open_ad_modal);

function open_ad_modal(){
    var selector = $(this).data("selector");
}

function open_cm_offcanvas() {

    var selector = $(this).data("selector");
    var body = selector + '_content';
    var url = $(this).data("url");

    $(body).load(url, function () {
        // $(body+' select').select2({
        //     theme: 'bootstrap-5',
        //     minimumResultsForSearch: -1,
        //     dropdownParent: $(selector)
        // });
        //$('select').selectpicker();
        // initialize_select2(select2);
        $(selector).offcanvas('show');
    });
    console.log(body);
}

function open_cm_modal() {

    var selector = $(this).data("selector");
    
    var url = $(this).data("url");
    var select2init = $(this).data("select2") ?? '';
    var multiselect=$(this).data("multiselect") ?? '';
    var init_function=$(this).data("init_function") ?? '';
    load_modal(selector,url,select2init,multiselect,init_function);
    

}
function load_modal(selector,url,select2init='',multiselect='',init_function=''){
    var body = selector + '_content';
    $(body).load(url, function () {
        if (!select2init.length&&!multiselect.length) {
            $(body + ' select').select2({
                theme: 'bootstrap-5',
                dropdownParent: $(selector),
                placeholder: {
                    id: '', // the value of the option
                    text: 'None Selected'
                },
                allowClear: true
            });
        } else if(multiselect.length) {
            $('.selectpicker').selectpicker();
            $('.custom-select').select2({
                theme: 'bootstrap-5',
                dropdownParent: $(selector),
                placeholder: {
                    id: '', // the value of the option
                    text: 'None Selected'
                },
                minimumResultsForSearch: -1,
                allowClear: true
            });
        }else{
            b_find('.custom-select').select2({
                theme: 'bootstrap-5',
                dropdownParent: $(selector),
                placeholder: {
                    id: '', // the value of the option
                    text: 'None Selected'
                },
                allowClear: true
            });
            window[select2init](selector);
        }

        if(init_function.length>0){
           
            window[init_function]();
        }

        b_find('.single_date_picker').daterangepicker({
            startDate: start,
            singleDatePicker:true,
            timePicker:true,
            
            locale: {
                format: 'YYYY-MM-DD hh:mm a'
            },
     
        });
        // $('select').selectpicker()
        // initialize_select2(select2);
        $(selector).modal('show');
    });
}






function make_select2(selector, url) {
    $(selector).select2({
        ajax: {
            url: url,
            dataType: 'json'
            // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
        }
    });
}


function initialize_select2(type) {
    type();
}

$(document).ready(function () {
    $('#preload').fadeOut();
});


function activate_tab(selector) {
    console.log(selector);
    if (selector == '#ecommerce') {
        $('body').find('.pro_description').show();
        $('body').find('.pro_meta_description').show();
    }
    $(selector).trigger('click');
    $(selector).tab('show');



}

function numf(n) {

    return Number(n);
}
function decf(n) {
    return numf(n).toFixed(2);
}


function preview_image(img) {
    return "https://cdncloudmeblb.azureedge.net/cloudmeimages2020/storage/images/" + img;
}


const Toast = Swal.mixin({
    toast: true,
    position: 'top-right',
    iconColor: 'white',
    customClass: {
        popup: 'colored-toast'
    },
    showConfirmButton: false,
    timer: 2000,
    timerProgressBar: true
})

function myToast(icon, title, timer = null, show_buttons = false) {
    Toast.fire({
        icon: icon,
        title: title,
        timerProgressBar: true,
        timer: timer ?? 1500,
        showConfirmButton: show_buttons
    })
}


$('body').on('click', '.cm_print_invoice', loadOtherPage);

function loadOtherPage(url='') {
    if (url=='') {
       url = $(this).data("url");
    }

    dd($(this).data("url"));
    $("<iframe>")                             // create a new iframe element
        .hide()                               // make it invisible
        .attr("src", url) // point the iframe to the page you want to print
        .appendTo("body");                    // add iframe to the DOM to cause it to load the page

}


$(document).ajaxError(function (event, jqxhr, settings, thrownError) {
   
    if (jqxhr.status == 401) {
        swal_error('You have logged out !, please login again');
        setTimeout(function () {
            location.reload();
        }, 1000);

    }
});
$(document).ajaxComplete(function (event, jqxhr, settings) {
    
//    dd(jqxhr.responseText);
//     if (jqxhr.responseText!=""&&JSON.parse(jqxhr.responseText).status == 66669) {
//         swal_error(JSON.parse(jqxhr.responseText).msg);
//         // setTimeout(function () {
//         //     location.reload();
//         // }, 1000);

//     }
});


var start = moment();
var end = moment();

$('.daterangepicker-default').daterangepicker({
    startDate: start,
    endDate: end,
    locale: {
        format: 'YYYY-MM-DD'
    },
    ranges: {
        'Today': [moment(), moment()],
        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
        'This Month': [moment().startOf('month'), moment().endOf('month')],
        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1,
            'month').endOf('month')]
    }
});

$('#reportrange').daterangepicker({
    startDate: start,
    endDate: end,
    locale: {
        format: 'YYYY-MM-DD'
    },
    ranges: {
        'Today': [moment(), moment()],
        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
        'This Month': [moment().startOf('month'), moment().endOf('month')],
        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1,
            'month').endOf('month')]
    }
});

// tinymce.init({
//     selector: 'textarea.cm_tiny',
//     height: 250,
//     plugins: 'searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap pagebreak nonbreaking anchor insertdatetime advlist lists wordcount help charmap quickbars emoticons',
//     imagetools_cors_hosts: ['picsum.photos'],
//     menubar: 'file edit view insert format tools table help',
//     toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
//     toolbar_sticky: true,
//     setup: function (editor) {
//         editor.on('change', function () {
//             editor.save();
//         });
//     }
// });
// $('body').find('textarea.cm_tiny')
// ClassicEditor
// .create( document.querySelector( 'textarea.cm_tiny' ) )
// .catch( error => {
//     console.error( error );
// } );






function search_item_on_input(mykey, location_id = '', call_back_function, by_location = true, exclude_combo = false) {

    var key = mykey;
    var loc_id = '';
    loc_id = location_id??current_location_id;
    if (by_location) {
        swal_error('Please Select Location First');
        return false;
    }




    var url = URL_item_search;

    let data = {

        'key': key,
        'loc_id': loc_id,
        'limit': product_search_list_limit,
        'exclude_combo': exclude_combo
    };

    var data1 = '';

    data1 = ajax_get(url, data, true, call_back_function);







}

function show_product_search_results(data, selector) {
    b_find(".item_list_drop_down").remove();
    $('body').find(selector).after(data);
    $('body').find("#search_result_list").dropdown('toggle');
}

function drop_down_products(data1) {
    if (data1.length < 1) {
        myToast('error', 'No Products found');
        return false;
    }
    var html =
        '<a class="item_list_drop_down" id="search_result_list" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false"></a><ul class="dropdown-menu item_list_drop_down shadow-lg product_list" role="menu"   style="position: absolute;z-index:1600;width:90%">';
    $.each(data1, function (i) {

        var plainText = JSON.stringify(data1[i]);
        var encrypted = CryptoJS.AES.encrypt(plainText, 'cloudme');

        html +=
            '<a href="javascript:void(0)" class="dropdown-item search_list_item "  data-details=\'' +
            encrypted + '\'>' + data1[i].price_master.name + ' ' + ' <span>Cost:' + decf(data1[i].price_master.cost) + '</span> </a>';

    });
    html += '</ul>';

    show_product_search_results(html, search_results_selector);


}

function search_product() {

    var loc_id = $('body').find('#location_id').val() ?? current_location_id;
    var mykey = $(this).val();
    current_row = $(this).parent().parent();
    search_results_selector = $(this).data('result_div') != undefined ? $(this).data('result_div') : $(this);
   
    if ($(this).val().length > 2) {
        if (timeout) {
            clearTimeout(timeout);
        }
        timeout = setTimeout(function () {
            search_item_on_input(mykey, loc_id, 'drop_down_products', false);


        }, 500);

    }


}

function dd(d) {
    console.log(d);
}



function cm_normal_delete(id) {

    var delete_url = $(id).data('url');
    console.log();
    res = ajax_get(delete_url, null, false);
    table.draw();

}

function modal_close_check() {
    return $('body').find('.stay_page_after_save').is(':checked');
}
function b_find(selector) {
    return $('body').find(selector);
}

function b_find_val(selector) {
    return $('body').find(selector).val();
}


$('body').on('change','.business_location_radio',ask_change_business_location);


function ask_change_business_location(){
   
    swal_confirm('Are you sure?','Screen will be refreshed after this','change_business_location',$(this).val())
}

function change_business_location(loc_id){

    ajax_get(URL_current_location+'/'+loc_id,null,false);
    location.reload();
}

function make_slug(str){
    return str.toString().toLowerCase()
    .replace(/\s+/g, '_')           // Replace spaces with -
    .replace(/[^\u0100-\uFFFF\w\-]/g,'_') // Remove all non-word chars ( fix for UTF-8 chars )
    .replace(/\-\-+/g, '-')         // Replace multiple - with single -
    .replace(/^-+/, '')             // Trim - from start of text
    .replace(/-+$/, '');            // Trim - from end of text
}



// document.addEventListener("visibilitychange", function() {
//     if (document.hidden){
//         console.log("Browser tab is hidden")
//     } else {
//         console.log("Browser tab is visible")
//         location.reload();
//     }
//  });

$('body').on('change','.cm_tfilters',function(){
    dd(1);
    $('#cmt_company').DataTable().draw();
})


// $('body').on('click','.navbar-nav .nav-item',function(){
//     $('.collapse').not(this).collapse('hide');
// });