
  $(document).ready(function () {

    var ResourceUploader = function(triggerSelector, inputSelector, holder) {
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

    var FeatureImageUploader = function(triggerSelector, inputSelector, name, holder) {
      var trigger = $(triggerSelector);
      var input = $(inputSelector);

      $(trigger).on("click", function () {
          console.log("hi");
          input.click();
      });

      input.change(function() {
        if (this.files && this.files[0]) {
          $(name).html(input.val());
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
    ResourceUploader('#resources-upload .upload-trigger'
    ,'#resources-upload input[type="file"]'
    ,"#attachment-holder");

    // feature image uploader
    FeatureImageUploader('#important-stuff .upload-trigger',
    '#important-stuff-upload input[type="file"]',
    '#filename',
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
    })
    .bind('sortstop', function(e, ui) {
      var formOrderForm = $('#form-order');
      var formOrder = "";
      $(ui.startparent).find("[data-moveid]").each(function(index,element) {
        formOrder += $(element).attr("data-moveid");
      });
      formOrderForm.val(formOrder);
      console.log(formOrderForm.val())
    });

    draggableFormFields();

    function draggableFormFields() {
      $('.draggable-form-fields').sortable({
        forcePlaceholderSize: true, items: ':not(.sort-disabled)', //  to specifiy which items inside the element should be sortable:
        placeholderClass: 'placeholde-class',
        hoverClass: 'is-hovered' // Defaults to false
        //handle: '.drag-icon-inner' //to restrict drag start to the specified element:
      })
      .bind('sortstop', function(e, ui) {
        var elements = $(ui.startparent).find('.position');
        elements.each(function(index, element) {
          console.log(index, element);
          $(element).val(index);
        });
      });
    }

    function formTemplate(number, sectionID) {
      var formTemplate =
      '<div aria-grabbed="false" class="col-xs-12 col-md-4 form-field" data-item-sortable-id="2" draggable="true" role="option">' +
      '  <label>' +
      '    <span contenteditable="true">NEW TOPIC</span>' +
      '    <span class="inline-edit">' +
      '      <a href="#">' +
      '        <i class="fa fa-pencil"></i>' +
      '      </a>' +
      '      <a class="drag-icon-inner" href="javascript:void(0);">' +
      '        <i class="fa fa-arrows"></i>' +
      '      </a>' +
      '    </span>' +
      '  </label>' +
      '  <div class="input hidden project_project_fields_position">' +
      '    <input class="hidden position" id="project_project_fields_attributes_' + number +'_position" ' + 'name="project[project_fields_attributes][' + number + '][position]" type="hidden">' +
      '  </div>' +
      '  <div class="input hidden project_project_fields_type_id">' +
      '    <input value = "' + sectionID + '" class="hidden type-' + sectionID +  '" id="project_project_fields_attributes_' + number +'_type_id"' + 'name="project[project_fields_attributes][' + number + '][type_id]" type="hidden">' +
      '  </div>' +
      '  <div class="input text optional project_project_fields_content">' +
      '    <textarea class="text optional form-control"' +  ' id="project_project_fields_attributes_' + number +'_content" ' + 'name="project[project_fields_attributes][' + number + '][content]"></textarea>' +
      '  </div>' +
      '  <a sectionID="' + sectionID + '" class="add-topic text-right" href="javascript:void(0);">' +
      '    <i class="fa fa-plus-circle"></i>' +
      '    ADD TOPIC</a>' +
      '</div>'

      return formTemplate;
    }

    $('body').on('click', 'a.add-topic', function () {
      var sectionID = $(this).attr('sectionID');
      var count = $(".type-" + sectionID).length + 1
      $(this).parent().after(formTemplate(count, sectionID));
      $(this).remove();
      draggableFormFields(); // re-initialize draggable formfields
    });
  });
