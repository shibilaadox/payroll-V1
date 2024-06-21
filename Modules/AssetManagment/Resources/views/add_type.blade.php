<div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Machine Type</h5>

    </div>
    <form data-href="{{ route('type.store') }}" class="adForm" id="adForm" method="POST">
        @csrf
        <div class="modal-body">
            <div class="">

                <div class="row">

                    <div class="col-md-12">
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-4 col-form-label">Name</label>
                            <div class="col-sm-7">
                                <input type="text" name="name" class="form-control" id="inputEmail3">
                            </div>
                        </div>

                    </div>

                    <input type="hidden" name="row_id" value="">

                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" name="submitform" id="submitform" class="btn btn-primary">Save</button>
            </div>

        </div>


    </form>
</div>
<script>
   
</script>
