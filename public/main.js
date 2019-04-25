//set datepickers for the 2 inputs
var init = []
var date = ""

$('#datepickerI').datepicker({
	minDate: 0,
	dateFormat: "dd/mm/yy",
	onSelect: function (selected, evnt) {
		date = selected;
		init = date.split("/");
		for (var i = 0; i < init.length; i++) {
			init[i] = parseInt(init[i], 10);
		}
		$('form input[type="text"]').prop("diable", false);
		$("#datepickerF").datepicker({
			dateFormat: "dd/mm/yy",
			minDate: new Date(init[2], init[1], init[0])
			//minDate: new Date(2019,4,20)
		});
	}
});