@extends('layouts.master')

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    @section('main-content')
    <div class="">

        <div class=" text-center">
            <h1>GUARD-3 JR</h1>
            <h4>SUNRISE SECURITY SERVICES, INC.</h4>
        </div>

        <div class="mt-5">
            <p class="fw-bold">
                Period &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                <span>
                    06/01/2021 to 06/15/2021
                </span>
            </p>

            <p class="fw-bold">
                Pay Date &nbsp; :
                <span>
                    06/21/2021
                </span>
            </p>
        </div>


        <table class="table text-center mt-5">
            <thead >
              <tr>
                <th scope="col">Item</th>
                <th scope="col">Amount</th>
                <th scope="col">Item</th>
                <th scope="col">Amount</th>
                <th scope="col">Deductions</th>
                <th scope="col">Amount</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th>Basic</th>
                <td>11,274.16</td>
                <td></td>
                <td></td>
                <td>SSS Prem.</td>
                <td>517.50</td>
              </tr>
            </tbody>
          </table>

    </div>
    @endsection

