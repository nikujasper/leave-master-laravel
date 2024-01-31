<form action="leaveform" method="post">
    @csrf

    <label for="ename">Employee Name:</label>
    <select id="ename" name="ename">
        <option value="0">-select-</option>
    </select><br>

    <label for="ltype">Leave Type:</label>
    <select id="ltype" name="ltype">
        <option value="0">-select-</option>
    </select><br>

    <label for="total">Total:</label>
    <input type="text" name="total" id="total" readonly><br>

    <label for="applyleave">Apply Leave:</label>
    <input type="text" name="aleave" id="aleave"><span id="sid"></span><br>

    <input type="submit" value="Apply">
</form>
<p>{{isset($message)?$message:''}}</p>


<script src="{{URL::asset('js/jQuery.js')}}" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $.ajax({
            url: "nameurl",
            type: "get",
            dataType: "JSON",
            data: {},
            success: function(res) {
                json_text = JSON.stringify(res);
                obj = JSON.parse(json_text);
                obj.forEach(element => {
                    $('#ename').append('<option value="' + element.emp_id + '">' + element.emp_name + '</option>');
                });
            }
        })

        $("#ename").change(function() {
            op = '';
            $.ajax({
                url: "leaveurl",
                type: "get",
                dataType: "JSON",
                data: {},
                success: function(res) {
                    json_text = JSON.stringify(res);
                    obj = JSON.parse(json_text);
                    obj.forEach(element => {
                        op += ('<option value="' + element.leave_id + '">' + element.leave_name + '</option>');
                    });
                    $('#ltype').html(op);
                    $('#total').val('');
                    $('#aleave').val('');
                    $('#sid').text('');

                }
            })
        })

        $("#ltype").change(function() {
            $.ajax({
                url: "totalurl",
                type: "get",
                dataType: "JSON",
                data: {
                    lid: $("#ltype").val(),
                    eid: $("#ename").val()
                },
                success: function(res) {
                    json_text = JSON.stringify(res);
                    obj = JSON.parse(json_text);
                    $('#total').val(obj.no_of_leave)
                }
            })
        })
        $("#aleave").blur(function() {
            var tleave = $('#total').val();
            var applyleave = $('#aleave').val();
            if (Number(applyleave) > Number(tleave) || Number(applyleave) < 1) {
                $('#sid').text('Invalid..!!');
                $('#aleave').val('');
            } else {
                $('#sid').text('Success..!!');

            }
        })
    })
</script>