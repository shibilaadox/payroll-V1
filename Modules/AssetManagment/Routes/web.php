<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::prefix('assetmanagment')->group(function () {
    Route::get('/machines', 'AssetManagmentController@index')->name('machines.index');
    Route::get('/machines/create','AssetManagmentController@create')->name('machines.create');
    Route::post('/machines','AssetManagmentController@store')->name('machines.store');
    Route::get('/machines/{id}/edit','AssetManagmentController@edit')->name('machines.edit');
    Route::post('machines/{id}','AssetManagmentController@delete')->name('machines.delete');


    Route::get('/machine_type/create', 'MachineTypeController@create')->name('type.add');
    Route::post('/machine_type', 'MachineTypeController@store')->name('type.store');
    
});
