function check_schema() {
  var schema = '';

  for (var i = 0, n = document.form_schema.length; i < n; i++) {
    if (document.form_schema.elements[i].checked) {
      schema = document.form_schema.elements[i].value;
    }
  }

  location.href = document.form_schema.action + '?schema=' + schema;
}
