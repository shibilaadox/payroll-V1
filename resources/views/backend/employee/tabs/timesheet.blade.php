@if ($tab == 'timesheet')

        <div class="row">
            <div class="col-sm-12 mt-5">

                <table id="project_datatable" class="display table table-striped table-bordered dataTable"
                    style="width: 100%;" role="grid" aria-describedby="comma_decimal_table_info">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th>Employee</th>
                            <th>Month</th>
                            <th>Days Worked</th>
                            <th>Creating Date</th>
                        </tr>
                    </thead>

                    <tbody>
                        @php
                            $i = 1;
                        @endphp
                        @foreach ($timesheet as $entry)
                            <tr>
                                <th scope="row">{{ $i++ }}</th>
                                <td>{{ $employee->firstname }} {{ $employee->lastname }}</td>
                                <td>{{ $entry->month }}</td>
                                <td>{{ $entry->days_worked }}</td>
                                <td>{{ $entry->created_at }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

            </div>
        </div>

@endif

</div>
