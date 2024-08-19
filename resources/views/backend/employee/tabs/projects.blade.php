
<div class="row">
    <div class="col-sm-12 mt-5">
        <table id="project_datatable" class="display table table-striped table-bordered dataTable" style="width: 100%;"
            role="grid" aria-describedby="comma_decimal_table_info">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Project Name</th>
                    <th scope="col">Client</th>
                    <th scope="col">Project Type</th>
                    <th scope="col">Project Phases</th>
                    <th scope="col">Project Status</th>
                    <th scope="col">Date</th>
                    <th scope="col">Description</th>
                    <th scope="col">Assigned To</th>
                    <th scope="col">Payment</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $i = 1;
                @endphp
                @foreach($employee->projects as $project)
                <tr>
                    <td>{{ $project->id }}</td>
                    <td>{{ $project->project_name }}</td>
                    <td>{{ $project->clients->name }}</td>
                    <td>{{ $project->project_type }}</td>
                    <td>{{ $project->project_phase }}</td>
                    <td>{{ $project->status }}</td>
                    <td>{{ $project->start_date }} to {{ $project->end_date }}</td>
                    <td>{{ $project->description }}</td>
                    <td>{{ $project->salary }}</td>
                </tr>
            @endforeach

            </tbody>

        </table>
    </div>
</div>
