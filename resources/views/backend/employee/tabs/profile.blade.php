<div class="row">
    <div class="col-lg-6">
        <div class="card card-profile-1 mb-4 mt-5">

            <div class="row p-3" style="display: flex; align-items:center; justify-content:space-around">
                <div class="col-lg-4">
                    <div class="shadow ms-5" style="width: 65%;">

                        <a <?php if(!empty($employee_project_id)){?>href={{ route('employee.invoice', $employee_project_id) }}<?php } ?>>
                            <img src="https://odoos.in/apps/HRMS/assets/images/faces/1.jpg" alt="">
                        </a>
                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="card-body text-start">
                        <h4 class="fw-bold">{{ $employee->firstname }} {{ $employee->lastname }}</h4>
                        <h8>{{ $employee->email }}</h8><br>
                        <h8>{{ $employee->userdetails->designations->name ?? 'N/A' }}</h8><br>
                        <h8>{{ $employee->userdetails->departments->name ?? 'N/A' }}</h8>
                    </div>
                </div>
            </div>

        </div>


        <div class="card card-profile-1 mb-4">
            <div class="card-body text-start ms-5 mt-3">
                <h6 class="fw-bold">Profile Info</h6><br>
                <div class="text-secondary">
                    <p>Employee ID: {{ $employee->employee_code ?? 'N/A' }}</p>
                    <p>Full Name: {{ $employee->firstname }} {{ $employee->lastname }}</p>
                    <p>Designation: {{ $employee->userdetails->designations->name ?? 'N/A' }}</p>
                    <p>Department: {{ $employee->userdetails->departments->name ?? 'N/A' }}</p>
                    <p>Gender: {{ $employee->gender ?? 'N/A' }}</p>
                    <p>Date of Birth: {{ $employee->dob ?? 'N/A' }}</p>
                    <p>Email: {{ $employee->email }}</p>
                    <p>Mobile: {{ $employee->phone ?? 'N/A' }}</p>
                    <p>Joining Date: {{ $employee->userdetails->joining_date ?? 'N/A' }}</p>
                    <p>Marital Status: {{ $employee->userdetails->marital_status ?? 'N/A' }}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="card card-profile-1 mb-4 mt-5 ">
            <div class="card-body text-start ms-5 mt-3">
                <h6 class="fw-bold">About</h6><br>
                <p></p><br>
            </div>
        </div>

        <div class="card card-profile-1 mb-4">
            <div class="card-body text-start ms-5 mt-3">
                <h6 class="fw-bold">Address Details</h6><br>

                <div class="text-secondary" style="display: flex; align-items:start;">
                    <div>
                        <h6 class="fw-bold">Permanent Address</h6>
                        <p>{{ $employee->useraddresses->permanent_address ?? 'N/A' }}</p>
                        <p>{{ $employee->useraddresses->permanent_city ?? 'N/A' }}</p>
                        <p>{{ $employee->useraddresses->permanent_state ?? 'N/A' }}</p>
                        <p>{{ $employee->useraddresses->permanent_country ?? 'N/A' }}</p>
                        <p>{{ $employee->useraddresses->permanent_pincode ?? 'N/A' }}</p>
                    </div>

                    <div class="ms-5 ps-5">
                        <h6 class="fw-bold">Residential Address</h6>
                        <p>{{ $employee->useraddresses->residential_address ?? 'N/A' }}</p>
                        <p>{{ $employee->useraddresses->residential_city ?? 'N/A' }}</p>
                        <p>{{ $employee->useraddresses->residential_state ?? 'N/A' }}</p>
                        <p>{{ $employee->useraddresses->residential_country ?? 'N/A' }}</p>
                        <p>{{ $employee->useraddresses->residential_pincode ?? 'N/A' }}</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
