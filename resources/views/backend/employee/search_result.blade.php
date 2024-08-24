

        <span id="search_result">
        <?php foreach ($data['users'] as $row) { ?>

        <a href="{{ route('employee.single', $row->id) }}" style="text-decoration: none; color:inherit">

            <div class="col-md-3" style="float:left">
                <div class="card card-profile-1 mb-4">
                    <div class="card-body text-center">
                        <div class="avatar box-shadow-2 mb-3">
                            <img src="<?php echo $row->profile_photo?>" alt="">
                        </div>
                        <h7 class="m-0"><b><?php echo $row->firstname . ' ' . $row->lastname; ?></b></h7><br>
                        <h8><?php //echo $row->userdetails->departments->name
                        ?></h8><br>
                        <h8><?php echo $row->email; ?></h8><br>
                        <h8><?php echo $row->phone; ?></h8>

                        <div class="card-socials-simple mt-4">
                            <a class="text-success mr-2" href="{{ route('employee.edit', $row->id) }}">
                                <i class="nav-icon i-Pen-2 font-weight-bold fs-16"></i>
                            </a>

                            <a class="text-danger mr-2" onclick="delete_user('{{ $row->id }}')"
                                title="Disbale employee">
                                <i class="nav-icon i-Close-Window font-weight-bold fs-16"></i>
                            </a>

                        </div>
                    </div>
                </div>
            </div>

        </a>

        <?php }  ?>
        
        