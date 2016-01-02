
  $(document).ready(function () {
    /**  Resources section - Fileupload Plugin Initialization**/
    $('#resources-upload .upload-trigger').on("click", function () {
      $('#resources-upload input[type="file"]').click(); // Simulate a click on the file input button to show the file browser dialog
    });

    $("#resources-upload").fileupload({
      url: $(this).attr('data-url'), // set server side upload file path
      dropZone: $('#resources-upload'), // This element will accept file drag/drop uploading
      add: function (e, data) {
        var jqXHR = data.submit(); // Automatically upload the file once it is added to the queue
      },
      done: function (e, data) {
        alert("File uploaded successfully"); // Callback for successful upload requests
      },
      fail: function (e, data) {
        alert("Error in file upload"); // Callback for successful upload requests
      }
    });

    /** Important Stuff section - Fileupload Plugin Initialization**/
    $('#important-stuff .upload-trigger').on("click", function () {
      $('#important-stuff-upload input[type="file"]').click(); // Simulate a click on the file input button to show the file browser dialog
    });

    $("#important-stuff-upload").fileupload({
      url: $(this).attr('data-url'), // set server side upload file path
      dropZone: $('#important-stuff-upload'), // This element will accept file drag/drop uploading
      add: function (e, data) {
        var jqXHR = data.submit(); // Automatically upload the file once it is added to the queue
      },
      done: function (e, data) {
        alert("File uploaded successfully"); // Callback for successful upload requests
      },
      fail: function (e, data) {
        alert("Error in file upload"); // Callback for successful upload requests
      }
    });

    /** The Slider section - Fileupload Plugin Initialization**/
    $('.slide-upload').on("click", function (e) {
      if ($(e.target).is('.slide-upload')) {
        $(this).children('input[type="file"]').click(); // Simulate a click on the file input button to show the file browser dialog
      }
    });
    $(".slide-upload").each(function (index, value) {
      $(".slide-upload:eq(" + index + ")").fileupload({
        url: $(this).attr('data-url'), // set server side upload file path
        dropZone: $(this), // This element will accept file drag/drop uploading
        add: function (e, data) {
          var jqXHR = data.submit(); // Automatically upload the file once it is added to the queue
        },
        done: function (e, data) {
          alert("File uploaded successfully"); // Callback for successful upload requests
        },
        fail: function (e, data) {
          alert("Error in file upload"); // Callback for successful upload requests
        }
      });
    });

    // Prevent the default action when a file is dropped on the window
    $(document).on('drop dragover', function (e) {
      e.preventDefault();
    });

    /** Sortable (or) movable  Plugin Initialization **/
    $('.panel-sortable').sortable({
      items: ':not(.sort-disabled)', //  to specifiy which items inside the element should be sortable:
      placeholderClass: 'placeholde-class',
      forcePlaceholderSize: true,
      hoverClass: 'is-hovered' // Defaults to false
      //handle: '.drag-icon' //to restrict drag start to the specified element:
    });

    draggableFormFields();

    function draggableFormFields() {
      $('.draggable-form-fields').sortable({
        forcePlaceholderSize: true, items: ':not(.sort-disabled)', //  to specifiy which items inside the element should be sortable:
        placeholderClass: 'placeholde-class',
        hoverClass: 'is-hovered' // Defaults to false
        //handle: '.drag-icon-inner' //to restrict drag start to the specified element:
      });
    }

    /** Add Dynamiv Formfield **/
    var formTemplate = '<div class="col-xs-12 col-md-4 form-field"><label><span contenteditable="true">NEW TOPIC</span><span class="inline-edit"><a href="#"><i class="fa fa-pencil"></i></a><a href="javascript:void(0);" class="drag-icon-inner"><i class="fa fa-arrows"></i></a' +
        '></span></label><textarea name="name" id="id" rows="1" class="form-control"></textarea><a href="javascript:void(0);" class="add-topic text-right"><i class="fa fa-plus-circle"></i> ADD TOPIC</a></div>';

    $('body').on('click', 'a.add-topic', function () {
      $(this).parent().after(formTemplate);
      $(this).remove();
      draggableFormFields(); // re-initialize draggable formfields
    });
  });
