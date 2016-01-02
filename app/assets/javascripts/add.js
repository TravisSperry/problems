
  $(document).ready(function () {

    var Uploader = function(triggerSelector, inputSelector, holder) {
      var trigger = $(triggerSelector);
      var input = $(inputSelector);

      $(trigger).on("click", function () {
          console.log("hi");
          input.click();
      });

      input.change(function() {
        if (this.files && this.files[0]) {
          var reader = new FileReader();
          reader.onload = function(event) {
            var url = "url(" + event.target.result + ")"
            $(holder).css("background-image", url);
          }
          reader.readAsDataURL(this.files[0]);
        }
      });
    }

    // project attachment uploader
    Uploader('#resources-upload .upload-trigger'
    ,'#resources-upload input[type="file"]'
    ,"#attachment-holder");

    // feature image uploader
    Uploader('#important-stuff .upload-trigger',
    '#important-stuff-upload input[type="file"]',
    '#important-stuff-upload');

    /** The Slider section - Fileupload Plugin Initialization**/
    $('.slide-upload').on("click", function (e) {
      if ($(e.target).is('.slide-upload')) {
        var input = $(this).find('input[type="file"]');
        input.click(); // Simulate a click on the file input button to show the file browser dialog

        input.change(function() {
          if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function(event) {
              var url = "url(" + event.target.result + ")"
              input.parent().parent().css("background-image", url);
            }
            reader.readAsDataURL(this.files[0]);
          }
        });

      } else console.log("wrong")
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
