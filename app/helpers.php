<?php

use Illuminate\Support\Facades\DB;
use App\Models\Upload;

function image_preview($id)
{
  if (isset($id)) {
    $image_name =  Upload::where('id', '=', $id)->pluck('file_name')->first();
    $path = url($image_name);
    return $path;
  } else {
    return 'No Image Found';
  }
}
