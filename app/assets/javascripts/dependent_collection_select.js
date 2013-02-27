/*
jQuery(function($) {
  function update_select() {
      var clinic = $('select#clinic_doctor_clinic_id :selected').val();
      if (clinic == "") clinic = "0";
      jQuery.get('/appointments/update_doctor_select/' + clinic, function(data) {
          $("#appointment_doctors").html(data);
      })
      return false;
    }
  $("#clinic_doctor_clinic_id").change(update_select);
  $("#clinic_doctor_clinic_id").ready(update_select);
})
*/
